import 'package:twake_calendar_mobile/features/realtime/domain/entities/ws_message.dart';

/// Calendar URI shape: `/calendars/{userId}/{calendarId}`.
final RegExp _kCalendarPathPattern =
    RegExp(r'^/calendars/[a-zA-Z0-9_-]+/[a-zA-Z0-9_-]+$');

/// Parses a decoded JSON map into a list of [WsMessage]s.
///
/// A single inbound payload may carry several semantically independent
/// updates (registered + calendar list + raw URI changes), so the parser
/// returns a list rather than a single message.
List<WsMessage> parseWsPayload(Map<String, dynamic> payload) {
  if (payload.isEmpty) {
    return <WsMessage>[const WsMessage.pong()];
  }

  final List<WsMessage> out = <WsMessage>[];

  if (payload.containsKey('registered')) {
    out.add(
      WsMessage.registered(
        uris: List<String>.from(payload['registered'] as Iterable<dynamic>),
      ),
    );
  }
  if (payload.containsKey('unregistered')) {
    out.add(
      WsMessage.unregistered(
        uris: List<String>.from(payload['unregistered'] as Iterable<dynamic>),
      ),
    );
  }
  if (payload['calendarList'] is Map) {
    final Map<dynamic, dynamic> listPayload =
        payload['calendarList'] as Map<dynamic, dynamic>;
    out.add(
      WsMessage.calendarListUpdate(
        subscribed: listPayload['subscribed'] is Iterable
            ? List<String>.from(listPayload['subscribed'] as Iterable<dynamic>)
            : const <String>[],
        deleted: listPayload['deleted'] == true,
      ),
    );
  }

  // Direct URI-based changes (`{"/calendars/x/y": {...}}`).
  for (final MapEntry<String, dynamic> entry in payload.entries) {
    if (_kCalendarPathPattern.hasMatch(entry.key)) {
      String? syncToken;
      if (entry.value is Map) {
        final dynamic raw = (entry.value as Map<dynamic, dynamic>)['syncToken'];
        syncToken = raw is String ? raw : null;
      }
      out.add(
        WsMessage.calendarChanged(
          calendarUri: entry.key,
          syncToken: syncToken,
        ),
      );
    }
  }

  if (out.isEmpty) {
    out.add(WsMessage.unknown(payload));
  }

  return out;
}
