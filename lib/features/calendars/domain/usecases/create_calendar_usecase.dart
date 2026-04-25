import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/calendars/domain/repositories/calendar_repository.dart';

part 'create_calendar_usecase.freezed.dart';

/// Parameters for [CreateCalendarUseCase].
@freezed
abstract class CreateCalendarParams with _$CreateCalendarParams {
  /// Creates a [CreateCalendarParams].
  const factory CreateCalendarParams({
    required String id,
    required String name,
    String? description,
    String? color,
  }) = _CreateCalendarParams;
}

/// Creates a personal calendar.
final class CreateCalendarUseCase
    extends FutureUseCaseWithParams<void, CreateCalendarParams> {
  /// Creates a [CreateCalendarUseCase].
  CreateCalendarUseCase({required CalendarRepository calendarRepository})
      : _calendarRepository = calendarRepository;

  final CalendarRepository _calendarRepository;

  @override
  Future<void> invoke(CreateCalendarParams params) =>
      _calendarRepository.createCalendar(
        id: params.id,
        name: params.name,
        description: params.description,
        color: params.color,
      );
}
