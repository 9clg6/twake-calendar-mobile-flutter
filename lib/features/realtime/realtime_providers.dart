import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/logging/log.dart';
import 'package:twake_calendar_mobile/core/websocket/twake_ws_client.dart';
import 'package:twake_calendar_mobile/core/websocket/twake_ws_client_provider.dart';
import 'package:twake_calendar_mobile/core/websocket/ws_state.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_controller.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_state.dart';
import 'package:twake_calendar_mobile/features/realtime/domain/entities/ws_message.dart';

/// Stream of [WsMessage] published by the underlying [TwakeWsClient].
///
/// Read-only — callers should treat the WS lifecycle (connect / register)
/// as managed by [realtimeBridgeProvider].
final StreamProvider<WsMessage> wsMessagesProvider = StreamProvider<WsMessage>(
  (Ref<AsyncValue<WsMessage>> ref) =>
      ref.watch(twakeWsClientProvider).messages,
  name: 'wsMessagesProvider',
);

/// Stream of [WsConnectionState] for status indicators (offline banner, etc.).
final StreamProvider<WsConnectionState> wsConnectionStateProvider =
    StreamProvider<WsConnectionState>(
  (Ref<AsyncValue<WsConnectionState>> ref) =>
      ref.watch(twakeWsClientProvider).state,
  name: 'wsConnectionStateProvider',
);

/// Bridge keeping the [TwakeWsClient] connection in sync with the auth
/// state.
///
/// - When the user signs in, opens the socket.
/// - When the user signs out, closes the socket.
/// - When the bridge is disposed (e.g. app quit), closes the socket.
///
/// Watch the provider once during bootstrap (e.g. inside the splash route)
/// to ensure the bridge stays alive — `keepAlive: true` would prevent it
/// from listening to provider rebuilds.
final Provider<void> realtimeBridgeProvider = Provider<void>(
  (Ref<void> ref) {
    final TwakeWsClient client = ref.watch(twakeWsClientProvider);
    final Log log = Log.named('RealtimeBridge');

    Future<void> apply(AuthState auth) async {
      if (auth.isLoading) return;
      if (auth.isLoggedIn) {
        if (client.currentState == WsConnectionState.disconnected) {
          log.info('Auth ok — opening WebSocket');
          unawaited(client.connect());
        }
      } else {
        log.info('Auth gone — closing WebSocket');
        unawaited(client.disconnect());
      }
    }

    apply(ref.read(authControllerProvider));
    ref.listen<AuthState>(
      authControllerProvider,
      (AuthState? previous, AuthState next) => apply(next),
    );
  },
  name: 'realtimeBridgeProvider',
);
