import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/entities/calendar.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';

/// Returns the calendars accessible to the current user.
final class GetCalendarsUseCase extends FutureUseCase<List<CalendarEntity>> {
  /// Creates a [GetCalendarsUseCase].
  GetCalendarsUseCase({required CalendarRepository calendarRepository})
      : _calendarRepository = calendarRepository;

  final CalendarRepository _calendarRepository;

  @override
  Future<List<CalendarEntity>> invoke() => _calendarRepository.fetchCalendars();
}
