import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twake_calendar_mobile/core/config/app_config.dart';
import 'package:twake_calendar_mobile/core/logging/log.dart';
import 'package:twake_calendar_mobile/core/network/retry_policy.dart';
import 'package:twake_calendar_mobile/core/websocket/ws_message_parser.dart';
import 'package:twake_calendar_mobile/core/websocket/ws_state.dart';
import 'package:twake_calendar_mobile/features/realtime/domain/entities/ws_message.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as ws_status;
import 'package:web_socket_channel/web_socket_channel.dart';

/// Default maximum number of reconnection attempts before giving up.
const int kMaxReconnectAttempts = 10;

/// Default timeout for the initial open handshake.
const Duration kConnectOpenTimeout = Duration(seconds: 10);

/// Real-time WebSocket client for Twake Calendar.
///
/// Mirrors the web frontend behaviour (`src/websocket/`):
///   1. Fetch a one-time ticket via `POST /ws/ticket`.
///   2. Open the socket on `${webSocketUrl}/ws?ticket=...`.
///   3. Periodic outbound `{type: 'ping', timestamp}` frames; pong is `{}`.
///   4. Reconnect with exponential backoff + jitter on unexpected closure.
final class TwakeWsClient {
  /// Creates a [TwakeWsClient].
  TwakeWsClient({
    required AppConfig config,
    required Dio dio,
    RetryPolicy retryPolicy = const RetryPolicy(),
    int maxReconnectAttempts = kMaxReconnectAttempts,
    Duration openTimeout = kConnectOpenTimeout,
  })  : _config = config,
        _dio = dio,
        _retryPolicy = retryPolicy,
        _maxReconnectAttempts = maxReconnectAttempts,
        _openTimeout = openTimeout;

  final AppConfig _config;
  final Dio _dio;
  final RetryPolicy _retryPolicy;
  final int _maxReconnectAttempts;
  final Duration _openTimeout;
  final Log _log = Log.named('TwakeWsClient');
  final math.Random _random = math.Random();

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _channelSub;
  Timer? _pingTimer;
  Timer? _pongTimer;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  bool _shouldReconnect = false;

  final BehaviorSubject<WsConnectionState> _stateSubject =
      BehaviorSubject<WsConnectionState>.seeded(WsConnectionState.disconnected);
  final PublishSubject<WsMessage> _messagesSubject =
      PublishSubject<WsMessage>();

  /// Stream of inbound messages parsed into [WsMessage].
  Stream<WsMessage> get messages => _messagesSubject.stream;

  /// Stream of [WsConnectionState] transitions.
  Stream<WsConnectionState> get state => _stateSubject.stream;

  /// Last published [WsConnectionState].
  WsConnectionState get currentState => _stateSubject.value;

  /// Opens the WebSocket. No-op if already connected/connecting.
  Future<void> connect() async {
    if (_stateSubject.value == WsConnectionState.connected ||
        _stateSubject.value == WsConnectionState.connecting) {
      return;
    }
    _shouldReconnect = true;
    await _openOnce();
  }

  /// Closes the socket and cancels reconnection.
  Future<void> disconnect() async {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    await _closeChannel();
    _setState(WsConnectionState.disconnected);
  }

  /// Sends a `register` payload for [calendarUris].
  Future<void> register(List<String> calendarUris) async {
    if (calendarUris.isEmpty) return;
    _send(<String, dynamic>{'register': calendarUris});
  }

  /// Sends an `unregister` payload for [calendarUris].
  Future<void> unregister(List<String> calendarUris) async {
    if (calendarUris.isEmpty) return;
    _send(<String, dynamic>{'unregister': calendarUris});
  }

  Future<void> _openOnce() async {
    _setState(WsConnectionState.connecting);
    try {
      final String ticket = await _fetchTicket();
      final Uri url = Uri.parse(
        '${_config.webSocketUrl}/ws?ticket=${Uri.encodeComponent(ticket)}',
      );
      final IOWebSocketChannel channel = IOWebSocketChannel.connect(
        url,
        connectTimeout: _openTimeout,
      );
      _channel = channel;
      _channelSub = channel.stream.listen(
        _onMessage,
        onError: (Object error, StackTrace stackTrace) {
          _log.warning('WebSocket error', error, stackTrace);
          _scheduleReconnect();
        },
        onDone: () {
          _log.info('WebSocket closed (code ${channel.closeCode}, '
              'reason ${channel.closeReason})');
          _scheduleReconnect();
        },
        cancelOnError: true,
      );
      _reconnectAttempts = 0;
      _setState(WsConnectionState.connected);
      _startPingLoop();
    } catch (e, st) {
      _log.error('Failed to open WebSocket', e, st);
      _scheduleReconnect();
    }
  }

  Future<String> _fetchTicket() async {
    final Response<dynamic> response = await _dio.post<dynamic>('/ws/ticket');
    final Object? data = response.data;
    if (data is Map && data['value'] is String) {
      return data['value'] as String;
    }
    throw const FormatException('Invalid ticket response');
  }

  void _onMessage(dynamic raw) {
    if (raw is! String) return;
    Map<String, dynamic>? payload;
    try {
      final Object? decoded = jsonDecode(raw);
      if (decoded is Map<String, dynamic>) {
        payload = decoded;
      }
    } catch (_) {
      _log.warning('Discarding non-JSON WS frame: $raw');
      return;
    }
    if (payload == null) return;

    for (final WsMessage message in parseWsPayload(payload)) {
      if (message is WsPong) {
        _onPongReceived();
        continue;
      }
      _messagesSubject.add(message);
    }
  }

  void _send(Map<String, dynamic> payload) {
    final WebSocketChannel? channel = _channel;
    if (channel == null) return;
    channel.sink.add(jsonEncode(payload));
  }

  void _startPingLoop() {
    _pingTimer?.cancel();
    _pingTimer = Timer.periodic(
      Duration(milliseconds: _config.wsPingPeriodMs),
      (_) => _sendPing(),
    );
  }

  void _sendPing() {
    _send(<String, dynamic>{
      'type': 'ping',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
    _pongTimer?.cancel();
    _pongTimer = Timer(
      Duration(milliseconds: _config.wsPingTimeoutPeriodMs),
      _onPongTimeout,
    );
  }

  void _onPongReceived() => _pongTimer?.cancel();

  void _onPongTimeout() {
    _log.warning('Pong timeout — reconnecting');
    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    _stopTimers();
    _channelSub?.cancel();
    _channelSub = null;
    _channel = null;
    if (!_shouldReconnect) return;
    if (_reconnectAttempts >= _maxReconnectAttempts) {
      _log.error('Max reconnect attempts reached, giving up');
      _setState(WsConnectionState.disconnected);
      return;
    }
    _setState(WsConnectionState.reconnecting);
    final Duration delay =
        _retryPolicy.delayFor(_reconnectAttempts, random: _random);
    _reconnectAttempts += 1;
    _reconnectTimer = Timer(delay, _openOnce);
  }

  void _stopTimers() {
    _pingTimer?.cancel();
    _pingTimer = null;
    _pongTimer?.cancel();
    _pongTimer = null;
  }

  Future<void> _closeChannel() async {
    _stopTimers();
    final WebSocketChannel? channel = _channel;
    _channel = null;
    final StreamSubscription<dynamic>? sub = _channelSub;
    _channelSub = null;
    await sub?.cancel();
    await channel?.sink.close(ws_status.normalClosure);
  }

  void _setState(WsConnectionState newState) {
    if (_stateSubject.value != newState) {
      _stateSubject.add(newState);
    }
  }

  /// Releases all resources.
  Future<void> dispose() async {
    await disconnect();
    await _stateSubject.close();
    await _messagesSubject.close();
  }
}
