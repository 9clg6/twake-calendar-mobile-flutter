import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';

/// Deletes a calendar by its CalDAV link.
final class DeleteCalendarUseCase
    extends FutureUseCaseWithParams<void, String> {
  /// Creates a [DeleteCalendarUseCase].
  DeleteCalendarUseCase({required CalendarRepository calendarRepository})
      : _calendarRepository = calendarRepository;

  final CalendarRepository _calendarRepository;

  @override
  Future<void> invoke(String params) =>
      _calendarRepository.deleteCalendar(params);
}
