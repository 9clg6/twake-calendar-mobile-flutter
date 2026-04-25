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
    DateTime cursor = DateTime(start.year, start.month, start.day);
    int index = 0;
    while (cursor.isBefore(end)) {
      // 2 events on weekdays only.
      if (cursor.weekday != DateTime.saturday &&
          cursor.weekday != DateTime.sunday) {
        events.add(
          CalendarEventEntity(
            uid: 'fake-$calendarId-$index-am',
            calId: calendarId,
            url: '/dav/calendars/me/$calendarId.json/fake-$index-am.ics',
            start: _iso(cursor.add(const Duration(hours: 9))),
            end: _iso(cursor.add(const Duration(hours: 10))),
            timezone: 'Europe/Paris',
            title: 'Stand-up',
          ),
        );
        events.add(
          CalendarEventEntity(
            uid: 'fake-$calendarId-$index-pm',
            calId: calendarId,
            url: '/dav/calendars/me/$calendarId.json/fake-$index-pm.ics',
            start: _iso(cursor.add(const Duration(hours: 14))),
            end: _iso(cursor.add(const Duration(hours: 15))),
            timezone: 'Europe/Paris',
            title: 'Design review',
          ),
        );
      }
      cursor = cursor.add(const Duration(days: 1));
      index += 1;
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
