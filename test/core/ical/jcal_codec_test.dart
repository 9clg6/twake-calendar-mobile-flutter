import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_codec.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/attendee_role.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/cutype.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_class.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/repeat_freq.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/transparency.dart';

void main() {
  group('JCalCodec', () {
    const JCalCodec codec = JCalCodec();

    test('parses a simple timed VEVENT', () {
      final List<dynamic> vevent = <dynamic>[
        'vevent',
        <dynamic>[
          <dynamic>['uid', <String, dynamic>{}, 'text', 'event-1'],
          <dynamic>['transp', <String, dynamic>{}, 'text', 'OPAQUE'],
          <dynamic>[
            'dtstart',
            <String, dynamic>{'tzid': 'Europe/Paris'},
            'date-time',
            '2025-07-18T09:00:00',
          ],
          <dynamic>['class', <String, dynamic>{}, 'text', 'PUBLIC'],
          <dynamic>['summary', <String, dynamic>{}, 'text', 'Team Meeting'],
          <dynamic>[
            'dtend',
            <String, dynamic>{'tzid': 'Europe/Paris'},
            'date-time',
            '2025-07-18T10:00:00',
          ],
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
        ],
        <dynamic>[],
      ];

      final CalendarEventEntity event = codec.parseVevent(
        vevent,
        calId: 'me-personal',
        url: '/dav/calendars/me/me-personal.json/event-1.ics',
      );

      expect(event.uid, 'event-1');
      expect(event.title, 'Team Meeting');
      expect(event.start, '2025-07-18T09:00:00');
      expect(event.timezone, 'Europe/Paris');
      expect(event.allday, isFalse);
      expect(event.transp, Transparency.opaque);
      expect(event.classification, EventClass.publicClass);
      expect(event.attendees, hasLength(1));
      expect(event.attendees.single.calAddress, 'bob@example.com');
      expect(event.attendees.single.partstat, Partstat.accepted);
      expect(event.attendees.single.role, AttendeeRole.reqParticipant);
      expect(event.attendees.single.cutype, CuType.individual);
      expect(event.attendees.single.rsvp, isTrue);
    });

    test('detects all-day events', () {
      final List<dynamic> vevent = <dynamic>[
        'vevent',
        <dynamic>[
          <dynamic>['uid', <String, dynamic>{}, 'text', 'event-allday'],
          <dynamic>[
            'dtstart',
            <String, dynamic>{'tzid': 'Europe/Paris'},
            'date',
            '2025-07-23',
          ],
          <dynamic>[
            'dtend',
            <String, dynamic>{'tzid': 'Europe/Paris'},
            'date',
            '2025-07-24',
          ],
          <dynamic>['summary', <String, dynamic>{}, 'text', 'Vacation'],
        ],
        <dynamic>[],
      ];

      final CalendarEventEntity event = codec.parseVevent(
        vevent,
        calId: 'me-personal',
        url: '/dav/calendars/me/me-personal.json/event-allday.ics',
      );

      expect(event.allday, isTrue);
      expect(event.start, '2025-07-23');
    });

    test('parses RRULE freq + interval and normalizes byday case', () {
      final List<dynamic> vevent = <dynamic>[
        'vevent',
        <dynamic>[
          <dynamic>['uid', <String, dynamic>{}, 'text', 'event-rec'],
          <dynamic>[
            'dtstart',
            <String, dynamic>{'tzid': 'Europe/Paris'},
            'date-time',
            '2025-07-18T09:00:00',
          ],
          <dynamic>['summary', <String, dynamic>{}, 'text', 'Weekly'],
          <dynamic>[
            'rrule',
            <String, dynamic>{},
            'recur',
            <String, dynamic>{
              'freq': 'WEEKLY',
              'interval': 2,
              'byday': <String>['mo', 'we'],
            },
          ],
        ],
        <dynamic>[],
      ];

      final CalendarEventEntity event = codec.parseVevent(
        vevent,
        calId: 'me-personal',
        url: '/dav/calendars/me/me-personal.json/event-rec.ics',
      );

      expect(event.repetition, isNotNull);
      expect(event.repetition!.freq, RepeatFreq.weekly);
      expect(event.repetition!.interval, 2);
      expect(event.repetition!.byday, <String>['MO', 'WE']);
    });

    test('round-trip preserves a recurring event', () {
      final CalendarEventEntity original = CalendarEventEntity(
        uid: 'event-rt',
        calId: 'me-personal',
        url: '/dav/calendars/me/me-personal.json/event-rt.ics',
        start: '2025-07-18T09:00:00',
        end: '2025-07-18T10:00:00',
        timezone: 'Europe/Paris',
        title: 'Round-trip',
        attendees: const <AttendeeEntity>[
          AttendeeEntity(
            calAddress: 'alice@example.com',
            partstat: Partstat.accepted,
            role: AttendeeRole.reqParticipant,
            cutype: CuType.individual,
            rsvp: true,
            cn: 'Alice',
          ),
        ],
        repetition: const RepetitionEntity(
          freq: RepeatFreq.weekly,
          interval: 2,
          byday: <String>['MO', 'WE'],
        ),
      );

      final List<dynamic> vcal = codec.buildVcalendar(original);
      final List<dynamic> components = vcal[2] as List<dynamic>;
      final List<dynamic> vevent = components.first as List<dynamic>;

      final CalendarEventEntity parsed = codec.parseVevent(
        vevent,
        calId: original.calId,
        url: original.url,
      );

      expect(parsed.uid, original.uid);
      expect(parsed.title, original.title);
      expect(parsed.start, original.start);
      expect(parsed.end, original.end);
      expect(parsed.timezone, original.timezone);
      expect(parsed.attendees, hasLength(1));
      expect(parsed.attendees.single.calAddress, 'alice@example.com');
      expect(parsed.repetition!.freq, RepeatFreq.weekly);
      expect(parsed.repetition!.interval, 2);
      expect(parsed.repetition!.byday, <String>['MO', 'WE']);
    });
  });
}
