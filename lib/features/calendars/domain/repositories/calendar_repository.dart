import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';

/// Contract of the calendar repository.
abstract interface class CalendarRepository {
  /// Returns every calendar accessible to the current user (own + shared +
  /// delegated + subscribed).
  Future<List<CalendarEntity>> fetchCalendars();
}
