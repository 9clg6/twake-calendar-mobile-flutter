import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/entities/calendar_event.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

/// Creates or updates a [CalendarEventEntity] (CalDAV PUT).
final class SaveEventUseCase
    extends FutureUseCaseWithParams<void, CalendarEventEntity> {
  /// Creates a [SaveEventUseCase].
  SaveEventUseCase({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  final EventRepository _eventRepository;

  @override
  Future<void> invoke(CalendarEventEntity params) =>
      _eventRepository.saveEvent(params);
}
