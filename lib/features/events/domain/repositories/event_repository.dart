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
}
