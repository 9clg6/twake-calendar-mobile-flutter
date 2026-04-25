import 'package:flutter_test/flutter_test.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_event_builder.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/alarm.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/repetition.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/event_class.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/repeat_freq.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/transparency.dart';

CalendarEventEntity baseEvent({
  String uid = 'event-1',
  String? title = 'Team Meeting',
  String start = '2026-04-25T09:00:00',
  String? end = '2026-04-25T10:00:00',
  String timezone = 'Europe/Paris',
  bool allday = false,
  EventClass classification = EventClass.publicClass,
  Transparency transp = Transparency.opaque,
  List<AttendeeEntity> attendees = const <AttendeeEntity>[],
  RepetitionEntity? repetition,
  AlarmEntity? alarm,
  String? recurrenceId,
}) {
  return CalendarEventEntity(
    uid: uid,
    calId: 'cal',
    url: '/dav/event.ics',
    start: start,
    end: end,
    timezone: timezone,
    title: title,
    allday: allday,
    classification: classification,
    transp: transp,
    attendees: attendees,
    repetition: repetition,
    alarm: alarm,
    recurrenceId: recurrenceId,
  );
}

/// Returns the property row matching [name] from [vevent].
List<dynamic>? findProp(List<dynamic> vevent, String name) {
  final List<dynamic> props = vevent[1] as List<dynamic>;
  for (final dynamic p in props) {
    if (p is List<dynamic> && p[0] == name) return p;
  }
  return null;
}

void main() {
  const JCalEventBuilder builder = JCalEventBuilder();

  group('JCalEventBuilder — atomic property tests', () {
    test('emits the uid', () {
      final List<dynamic> vevent = builder.build(baseEvent(uid: 'abc'));
      expect(findProp(vevent, 'uid')![3], 'abc');
    });

    test('emits OPAQUE transparency by default', () {
      final List<dynamic> vevent = builder.build(baseEvent());
      expect(findProp(vevent, 'transp')![3], 'OPAQUE');
    });

    test('emits TRANSPARENT when set', () {
      final List<dynamic> vevent =
          builder.build(baseEvent(transp: Transparency.transparent));
      expect(findProp(vevent, 'transp')![3], 'TRANSPARENT');
    });

    test('emits PRIVATE class', () {
      final List<dynamic> vevent =
          builder.build(baseEvent(classification: EventClass.privateClass));
      expect(findProp(vevent, 'class')![3], 'PRIVATE');
    });

    test('emits dtstart with tzid parameter', () {
      final List<dynamic> vevent = builder.build(baseEvent());
      final List<dynamic> dtstart = findProp(vevent, 'dtstart')!;
      expect((dtstart[1] as Map<dynamic, dynamic>)['tzid'], 'Europe/Paris');
    });

    test('switches dtstart type to date when allday=true', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        allday: true,
        start: '2026-04-25',
        end: '2026-04-26',
      ));
      expect(findProp(vevent, 'dtstart')![2], 'date');
    });

    test('emits a single attendee with mailto: prefix', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        attendees: const <AttendeeEntity>[
          AttendeeEntity(
            calAddress: 'bob@example.com',
            cn: 'Bob',
            partstat: Partstat.accepted,
            rsvp: true,
          ),
        ],
      ));
      final List<dynamic> attendee = findProp(vevent, 'attendee')!;
      expect(attendee[3], 'mailto:bob@example.com');
    });

    test('serialises attendee partstat', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        attendees: const <AttendeeEntity>[
          AttendeeEntity(calAddress: 'a@x', partstat: Partstat.declined),
        ],
      ));
      final List<dynamic> attendee = findProp(vevent, 'attendee')!;
      expect((attendee[1] as Map<dynamic, dynamic>)['partstat'], 'DECLINED');
    });

    test('serialises rsvp as TRUE/FALSE strings', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        attendees: const <AttendeeEntity>[
          AttendeeEntity(calAddress: 'a@x', rsvp: false),
        ],
      ));
      final List<dynamic> attendee = findProp(vevent, 'attendee')!;
      expect((attendee[1] as Map<dynamic, dynamic>)['rsvp'], 'FALSE');
    });

    test('emits rrule freq in uppercase', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        repetition: const RepetitionEntity(freq: RepeatFreq.weekly),
      ));
      final List<dynamic> rrule = findProp(vevent, 'rrule')!;
      expect((rrule[3] as Map<dynamic, dynamic>)['freq'], 'WEEKLY');
    });

    test('omits rrule interval when equal to 1', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        repetition: const RepetitionEntity(freq: RepeatFreq.weekly),
      ));
      final List<dynamic> rrule = findProp(vevent, 'rrule')!;
      expect(
          (rrule[3] as Map<dynamic, dynamic>).containsKey('interval'), isFalse);
    });

    test('emits rrule interval when greater than 1', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        repetition:
            const RepetitionEntity(freq: RepeatFreq.weekly, interval: 2),
      ));
      final List<dynamic> rrule = findProp(vevent, 'rrule')!;
      expect((rrule[3] as Map<dynamic, dynamic>)['interval'], 2);
    });

    test('emits a valarm sub-component when alarm is set', () {
      final List<dynamic> vevent = builder.build(baseEvent(
        alarm: const AlarmEntity(trigger: '-PT15M'),
      ));
      final List<dynamic> sub = vevent[2] as List<dynamic>;
      expect(sub.any((dynamic e) => (e as List<dynamic>).first == 'valarm'),
          isTrue);
    });

    test('emits recurrence-id when isOverride=true', () {
      final List<dynamic> vevent = builder.build(
        baseEvent(recurrenceId: '2026-04-25T09:00:00Z'),
        isOverride: true,
      );
      expect(findProp(vevent, 'recurrence-id'), isNotNull);
    });

    test('omits recurrence-id when isOverride=false', () {
      final List<dynamic> vevent = builder.build(
        baseEvent(recurrenceId: '2026-04-25T09:00:00Z'),
      );
      expect(findProp(vevent, 'recurrence-id'), isNull);
    });

    test('strips suffix from uid even when present in entity', () {
      final List<dynamic> vevent =
          builder.build(baseEvent(uid: 'master/2026-04-25T09:00:00'));
      expect(findProp(vevent, 'uid')![3], 'master');
    });
  });
}
