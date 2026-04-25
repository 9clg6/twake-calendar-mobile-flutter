import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/errors/ical_exception.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_event_parser.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/attendee_role.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/cutype.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_class.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_status.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/repeat_freq.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/transparency.dart';

import '../../_helpers/jcal_fixtures.dart';

void main() {
  group('JCalEventParser — atomic property tests', () {
    const JCalEventParser parser = JCalEventParser();

    CalendarEventEntity parse(List<dynamic> vevent) =>
        parser.parse(vevent, calId: 'cal', url: '/dav/x.ics');

    test('extracts the uid', () {
      final CalendarEventEntity event = parse(minimalVevent(uid: 'abc-123'));
      expect(event.uid, 'abc-123');
    });

    test('extracts the title from SUMMARY', () {
      final CalendarEventEntity event =
          parse(minimalVevent(summary: 'Stand-up'));
      expect(event.title, 'Stand-up');
    });

    test('extracts dtstart verbatim', () {
      final CalendarEventEntity event =
          parse(minimalVevent(dtstart: '2026-05-01T08:30:00'));
      expect(event.start, '2026-05-01T08:30:00');
    });

    test('extracts dtend verbatim', () {
      final CalendarEventEntity event =
          parse(minimalVevent(dtend: '2026-05-01T09:30:00'));
      expect(event.end, '2026-05-01T09:30:00');
    });

    test('extracts the tzid into timezone', () {
      final CalendarEventEntity event =
          parse(minimalVevent(tzid: 'Asia/Tokyo'));
      expect(event.timezone, 'Asia/Tokyo');
    });

    test('flags allday=true when dtstart is a date-only string', () {
      final CalendarEventEntity event = parse(minimalVevent(
        dtstart: '2026-05-01',
        dtend: '2026-05-02',
        dtType: 'date',
      ));
      expect(event.allday, isTrue);
    });

    test('flags allday=false on date-time values', () {
      final CalendarEventEntity event = parse(minimalVevent());
      expect(event.allday, isFalse);
    });

    test('parses CLASS=PRIVATE', () {
      final CalendarEventEntity event =
          parse(minimalVevent(classification: 'PRIVATE'));
      expect(event.classification, EventClass.privateClass);
    });

    test('parses TRANSP=TRANSPARENT', () {
      final CalendarEventEntity event = parse(minimalVevent(transp: 'TRANSPARENT'));
      expect(event.transp, Transparency.transparent);
    });

    test('parses STATUS when present', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>['status', <String, dynamic>{}, 'text', 'CANCELLED'],
      ]));
      expect(event.status, EventStatus.cancelled);
    });

    test('returns null status when STATUS is absent', () {
      final CalendarEventEntity event = parse(minimalVevent());
      expect(event.status, isNull);
    });

    test('parses location', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>['location', <String, dynamic>{}, 'text', 'Paris HQ'],
      ]));
      expect(event.location, 'Paris HQ');
    });

    test('strips mailto: prefix from organizer', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'organizer',
          <String, dynamic>{'cn': 'Alice'},
          'cal-address',
          'mailto:alice@example.com',
        ],
      ]));
      expect(event.organizer!.calAddress, 'alice@example.com');
      expect(event.organizer!.cn, 'Alice');
    });

    test('strips mailto: prefix from attendee', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'attendee',
          <String, dynamic>{
            'cn': 'Bob',
            'partstat': 'ACCEPTED',
            'rsvp': 'TRUE',
            'role': 'REQ-PARTICIPANT',
            'cutype': 'INDIVIDUAL',
          },
          'cal-address',
          'mailto:bob@example.com',
        ],
      ]));
      expect(event.attendees.single.calAddress, 'bob@example.com');
    });

    test('attendee partstat defaults to NEEDS-ACTION when missing', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'attendee',
          <String, dynamic>{},
          'cal-address',
          'mailto:bob@example.com',
        ],
      ]));
      expect(event.attendees.single.partstat, Partstat.needsAction);
    });

    test('attendee role defaults to REQ-PARTICIPANT', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'attendee',
          <String, dynamic>{},
          'cal-address',
          'mailto:bob@example.com',
        ],
      ]));
      expect(event.attendees.single.role, AttendeeRole.reqParticipant);
    });

    test('attendee cutype defaults to INDIVIDUAL', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'attendee',
          <String, dynamic>{},
          'cal-address',
          'mailto:bob@example.com',
        ],
      ]));
      expect(event.attendees.single.cutype, CuType.individual);
    });

    test('parses rsvp=TRUE into bool true', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'attendee',
          <String, dynamic>{'rsvp': 'TRUE'},
          'cal-address',
          'mailto:bob@example.com',
        ],
      ]));
      expect(event.attendees.single.rsvp, isTrue);
    });

    test('parses rrule freq', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'rrule',
          <String, dynamic>{},
          'recur',
          <String, dynamic>{'freq': 'WEEKLY'},
        ],
      ]));
      expect(event.repetition!.freq, RepeatFreq.weekly);
    });

    test('parses rrule interval', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'rrule',
          <String, dynamic>{},
          'recur',
          <String, dynamic>{'freq': 'WEEKLY', 'interval': 3},
        ],
      ]));
      expect(event.repetition!.interval, 3);
    });

    test('uppercases byday tokens', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'rrule',
          <String, dynamic>{},
          'recur',
          <String, dynamic>{
            'freq': 'WEEKLY',
            'byday': <String>['mo', 'we'],
          },
        ],
      ]));
      expect(event.repetition!.byday, <String>['MO', 'WE']);
    });

    test('parses count', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'rrule',
          <String, dynamic>{},
          'recur',
          <String, dynamic>{'freq': 'WEEKLY', 'count': 5},
        ],
      ]));
      expect(event.repetition!.count, 5);
    });

    test('parses until', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'rrule',
          <String, dynamic>{},
          'recur',
          <String, dynamic>{'freq': 'WEEKLY', 'until': '2026-12-31'},
        ],
      ]));
      expect(event.repetition!.until, '2026-12-31');
    });

    test('collects multiple EXDATE entries', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'exdate',
          <String, dynamic>{'tzid': 'Europe/Paris'},
          'date-time',
          '2026-04-26T09:00:00',
        ],
        <dynamic>[
          'exdate',
          <String, dynamic>{'tzid': 'Europe/Paris'},
          'date-time',
          '2026-04-27T09:00:00',
        ],
      ]));
      expect(event.exdates, <String>[
        '2026-04-26T09:00:00',
        '2026-04-27T09:00:00',
      ]);
    });

    test('captures unknown properties in passthroughProps', () {
      final CalendarEventEntity event = parse(minimalVevent(extraProps: <List<dynamic>>[
        <dynamic>[
          'x-twake-custom',
          <String, dynamic>{},
          'text',
          'opaque-payload',
        ],
      ]));
      expect(event.passthroughProps, hasLength(1));
      expect(event.passthroughProps.single[0], 'x-twake-custom');
    });

    test('throws IcalException on a non-vevent component', () {
      expect(
        () => parser.parse(<dynamic>['vtodo', <dynamic>[], <dynamic>[]],
            calId: 'cal', url: '/dav/x.ics'),
        throwsA(isA<IcalException>()),
      );
    });

    test('appends recurrenceId to the uid for occurrences', () {
      final CalendarEventEntity event = parse(minimalVevent(
        uid: 'master-1',
        extraProps: <List<dynamic>>[
          <dynamic>[
            'recurrence-id',
            <String, dynamic>{},
            'date-time',
            '2026-04-25T09:00:00',
          ],
        ],
      ));
      expect(event.uid, 'master-1/2026-04-25T09:00:00');
      expect(event.recurrenceId, '2026-04-25T09:00:00');
    });
  });
}
