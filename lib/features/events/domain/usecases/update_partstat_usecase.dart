import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/attendee.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/enums/partstat.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

part 'update_partstat_usecase.freezed.dart';

/// Parameters for [UpdatePartstatUseCase].
@freezed
abstract class UpdatePartstatParams with _$UpdatePartstatParams {
  /// Creates an [UpdatePartstatParams].
  const factory UpdatePartstatParams({
    required CalendarEventEntity event,
    required String attendeeAddress,
    required Partstat partstat,
  }) = _UpdatePartstatParams;
}

/// Updates the participation status of [params.attendeeAddress] on
/// [params.event] and PUTs the resulting event back.
final class UpdatePartstatUseCase
    extends FutureUseCaseWithParams<void, UpdatePartstatParams> {
  /// Creates an [UpdatePartstatUseCase].
  UpdatePartstatUseCase({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  final EventRepository _eventRepository;

  @override
  Future<void> invoke(UpdatePartstatParams params) {
    final List<AttendeeEntity> updated = params.event.attendees
        .map((AttendeeEntity a) => a.calAddress == params.attendeeAddress
            ? a.copyWith(partstat: params.partstat)
            : a)
        .toList();
    final CalendarEventEntity next =
        params.event.copyWith(attendees: updated);
    return _eventRepository.saveEvent(next);
  }
}
