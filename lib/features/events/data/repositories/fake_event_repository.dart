import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

/// In-memory event repository that fabricates a deterministic set of events
/// for the visible window so the UI runs without backend.
final class FakeEventRepository implements EventRepository {
  /// Creates a [FakeEventRepository].
  const FakeEventRepository();

  @override
  Future<List<CalendarEventEntity>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    final List<CalendarEventEntity> events = <CalendarEventEntity>[];
    final DateTime now = DateTime.now();
    DateTime cursor = DateTime(start.year, start.month, start.day);
    int index = 0;
    const List<({int hour, int duration, String title})> dailyAgenda =
        <({int hour, int duration, String title})>[
      (hour: 10, duration: 1, title: 'Twake Chat daily'),
      (hour: 14, duration: 1, title: 'figma to design system'),
    ];
    while (cursor.isBefore(end)) {
      for (final ({int hour, int duration, String title}) slot
          in dailyAgenda) {
        events.add(
          CalendarEventEntity(
            uid: 'fake-$calendarId-$index-${slot.hour}',
            calId: calendarId,
            url: '/dav/calendars/me/$calendarId.json/fake-$index-${slot.hour}.ics',
            start: _iso(cursor.add(Duration(hours: slot.hour, minutes: 30))),
            end: _iso(cursor.add(Duration(hours: slot.hour + slot.duration))),
            timezone: 'Europe/Paris',
            title: slot.title,
          ),
        );
      }
      cursor = cursor.add(const Duration(days: 1));
      index += 1;
    }
    // Demo nicety: also surface a "starting in 7 minutes" event today so
    // the local-reminder pipeline can be exercised live during the demo.
    if (start.isBefore(now) && end.isAfter(now)) {
      final DateTime soon = now.add(const Duration(minutes: 7));
      events.add(
        CalendarEventEntity(
          uid: 'fake-$calendarId-soon',
          calId: calendarId,
          url: '/dav/calendars/me/$calendarId.json/fake-soon.ics',
          start: _iso(soon),
          end: _iso(soon.add(const Duration(minutes: 30))),
          timezone: 'Europe/Paris',
          title: 'Demo reminder',
          location: 'You should get a notification 5 min before',
        ),
      );
    }
    return events;
  }

  @override
  Future<CalendarEventEntity?> fetchEvent(String url) async => null;

  @override
  Future<void> saveEvent(CalendarEventEntity event) async {
    // Fake repository: no-op (mutations are not persisted in dev mode).
  }

  @override
  Future<void> deleteEvent(String url) async {
    // Fake repository: no-op.
  }

  @override
  Future<void> moveEvent({
    required String fromUrl,
    required String toUrl,
  }) async {
    // Fake repository: no-op.
  }

  String _iso(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}T'
      '${date.hour.toString().padLeft(2, '0')}:'
      '${date.minute.toString().padLeft(2, '0')}:00';
}
