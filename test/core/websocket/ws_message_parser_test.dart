import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/websocket/ws_message_parser.dart';
import 'package:twake_calendar_mobile/features/realtime/domain/entities/ws_message.dart';

void main() {
  group('parseWsPayload', () {
    test('empty object -> WsPong', () {
      expect(parseWsPayload(const <String, dynamic>{}), <Matcher>[
        isA<WsPong>(),
      ]);
    });

    test('registered list', () {
      final List<WsMessage> result = parseWsPayload(<String, dynamic>{
        'registered': <String>['/calendars/u/c1', '/calendars/u/c2'],
      });
      expect(result, hasLength(1));
      final WsRegistered msg = result.single as WsRegistered;
      expect(msg.uris, <String>['/calendars/u/c1', '/calendars/u/c2']);
    });

    test('unregistered list', () {
      final List<WsMessage> result = parseWsPayload(<String, dynamic>{
        'unregistered': <String>['/calendars/u/c'],
      });
      final WsUnregistered msg = result.single as WsUnregistered;
      expect(msg.uris, <String>['/calendars/u/c']);
    });

    test('calendarList update', () {
      final List<WsMessage> result = parseWsPayload(<String, dynamic>{
        'calendarList': <String, dynamic>{
          'subscribed': <String>['/calendars/u/c'],
          'deleted': true,
        },
      });
      final WsCalendarListUpdate msg = result.single as WsCalendarListUpdate;
      expect(msg.subscribed, <String>['/calendars/u/c']);
      expect(msg.deleted, isTrue);
    });

    test('direct calendar URI key with sync token', () {
      final List<WsMessage> result = parseWsPayload(<String, dynamic>{
        '/calendars/alice/cal42': <String, dynamic>{
          'syncToken': 'urn:uuid:abc',
        },
      });
      final WsCalendarChanged msg = result.single as WsCalendarChanged;
      expect(msg.calendarUri, '/calendars/alice/cal42');
      expect(msg.syncToken, 'urn:uuid:abc');
    });

    test('combined registered + calendar URI emits two messages', () {
      final List<WsMessage> result = parseWsPayload(<String, dynamic>{
        'registered': <String>['/calendars/u/c'],
        '/calendars/alice/cal42': <String, dynamic>{},
      });
      expect(result, hasLength(2));
      expect(result.whereType<WsRegistered>(), hasLength(1));
      expect(result.whereType<WsCalendarChanged>(), hasLength(1));
    });

    test('unrecognised key -> WsUnknown', () {
      final List<WsMessage> result = parseWsPayload(<String, dynamic>{
        'foo': 'bar',
      });
      expect(result.single, isA<WsUnknown>());
    });

    test('rejects malformed calendar path (regex mismatch)', () {
      // Path with extra segment must not match the regex and is treated as
      // unknown.
      final List<WsMessage> result = parseWsPayload(<String, dynamic>{
        '/calendars/alice/cal42/event.ics': <String, dynamic>{},
      });
      expect(result.single, isA<WsUnknown>());
    });
  });
}
