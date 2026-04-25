import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

part 'get_events_in_range_usecase.freezed.dart';

/// Parameters for [GetEventsInRangeUseCase].
@freezed
abstract class GetEventsInRangeParams with _$GetEventsInRangeParams {
  /// Creates a [GetEventsInRangeParams].
  const factory GetEventsInRangeParams({
    required String calendarId,
    required DateTime start,
    required DateTime end,
  }) = _GetEventsInRangeParams;
}

/// Returns the events visible in `[start, end]` for a given calendar.
final class GetEventsInRangeUseCase extends FutureUseCaseWithParams<
    List<CalendarEventEntity>, GetEventsInRangeParams> {
  /// Creates a [GetEventsInRangeUseCase].
  GetEventsInRangeUseCase({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  final EventRepository _eventRepository;

  @override
  Future<List<CalendarEventEntity>> invoke(GetEventsInRangeParams params) =>
      _eventRepository.fetchEventsInRange(
        calendarId: params.calendarId,
        start: params.start,
        end: params.end,
      );
}
