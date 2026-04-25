import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_message.freezed.dart';

/// Inbound real-time message parsed from the WebSocket.
///
/// Sealed Freezed union mirroring the web frontend
/// (`src/websocket/messaging/parseMessage.ts`).
@freezed
sealed class WsMessage with _$WsMessage {
  /// A given calendar URI changed and needs a sync-token refresh.
  const factory WsMessage.calendarChanged({
    required String calendarUri,
    String? syncToken,
  }) = WsCalendarChanged;

  /// Confirmation that the client is now registered to the listed URIs.
  const factory WsMessage.registered({required List<String> uris}) =
      WsRegistered;

  /// Confirmation that the client is no longer registered to the listed URIs.
  const factory WsMessage.unregistered({required List<String> uris}) =
      WsUnregistered;

  /// The list of subscribed/deleted calendars changed.
  const factory WsMessage.calendarListUpdate({
    @Default(<String>[]) List<String> subscribed,
    @Default(false) bool deleted,
  }) = WsCalendarListUpdate;

  /// Empty pong from the server.
  const factory WsMessage.pong() = WsPong;

  /// Unknown or unhandled message — preserved for diagnostics.
  const factory WsMessage.unknown(Map<String, dynamic> payload) = WsUnknown;
}
