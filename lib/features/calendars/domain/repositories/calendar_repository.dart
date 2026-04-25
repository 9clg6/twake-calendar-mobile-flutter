import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';

/// Contract of the calendar repository.
abstract interface class CalendarRepository {
  /// Returns every calendar accessible to the current user (own + shared +
  /// delegated + subscribed).
  Future<List<CalendarEntity>> fetchCalendars();

  /// Creates a new personal calendar.
  Future<void> createCalendar({
    required String id,
    required String name,
    String? description,
    String? color,
  });

  /// Updates calendar properties (name / description / color).
  Future<void> updateCalendar({
    required String calendarLink,
    String? name,
    String? description,
    String? color,
  });

  /// Deletes a calendar.
  Future<void> deleteCalendar(String calendarLink);
}
