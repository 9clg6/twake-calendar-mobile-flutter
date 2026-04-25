import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_codec.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/attendee_role.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/cutype.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/repeat_freq.dart';

CalendarEventEntity sampleRecurringEvent() => CalendarEventEntity(
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

void main() {
  const JCalCodec codec = JCalCodec();

  group('JCalCodec round-trip', () {
    late CalendarEventEntity parsed;

    setUp(() {
      final List<dynamic> vcal = codec.buildVcalendar(sampleRecurringEvent());
      final List<dynamic> components = vcal[2] as List<dynamic>;
      parsed = codec.parseVevent(
        components.first as List<dynamic>,
        calId: 'me-personal',
        url: '/dav/calendars/me/me-personal.json/event-rt.ics',
      );
    });

    test('preserves uid', () {
      expect(parsed.uid, 'event-rt');
    });

    test('preserves title', () {
      expect(parsed.title, 'Round-trip');
    });

    test('preserves start', () {
      expect(parsed.start, '2025-07-18T09:00:00');
    });

    test('preserves end', () {
      expect(parsed.end, '2025-07-18T10:00:00');
    });

    test('preserves timezone', () {
      expect(parsed.timezone, 'Europe/Paris');
    });

    test('preserves the single attendee email', () {
      expect(parsed.attendees.single.calAddress, 'alice@example.com');
    });

    test('preserves the attendee partstat', () {
      expect(parsed.attendees.single.partstat, Partstat.accepted);
    });

    test('preserves repetition freq', () {
      expect(parsed.repetition!.freq, RepeatFreq.weekly);
    });

    test('preserves repetition interval', () {
      expect(parsed.repetition!.interval, 2);
    });

    test('preserves byday', () {
      expect(parsed.repetition!.byday, <String>['MO', 'WE']);
    });
  });
}
