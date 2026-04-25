import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';

part 'update_calendar_usecase.freezed.dart';

/// Parameters for [UpdateCalendarUseCase].
@freezed
abstract class UpdateCalendarParams with _$UpdateCalendarParams {
  /// Creates an [UpdateCalendarParams].
  const factory UpdateCalendarParams({
    required String calendarLink,
    String? name,
    String? description,
    String? color,
  }) = _UpdateCalendarParams;
}

/// Updates calendar properties via PROPPATCH.
final class UpdateCalendarUseCase
    extends FutureUseCaseWithParams<void, UpdateCalendarParams> {
  /// Creates an [UpdateCalendarUseCase].
  UpdateCalendarUseCase({required CalendarRepository calendarRepository})
      : _calendarRepository = calendarRepository;

  final CalendarRepository _calendarRepository;

  @override
  Future<void> invoke(UpdateCalendarParams params) =>
      _calendarRepository.updateCalendar(
        calendarLink: params.calendarLink,
        name: params.name,
        description: params.description,
        color: params.color,
      );
}
