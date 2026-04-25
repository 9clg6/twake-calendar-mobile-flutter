import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';

/// Contract for the events repository.
abstract interface class EventRepository {
  /// Returns the events of [calendarId] whose DTSTART falls in [start, end].
  Future<List<CalendarEventEntity>> fetchEventsInRange({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  });

  /// Returns a single event by its CalDAV URL.
  Future<CalendarEventEntity?> fetchEvent(String url);

  /// Creates or updates [event] (CalDAV PUT with jCal body).
  Future<void> saveEvent(CalendarEventEntity event);

  /// Deletes the event identified by [url].
  Future<void> deleteEvent(String url);

  /// Moves an event to another calendar.
  Future<void> moveEvent({required String fromUrl, required String toUrl});
}
