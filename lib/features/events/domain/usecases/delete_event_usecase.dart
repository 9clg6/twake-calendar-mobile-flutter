import 'package:twake_calendar_mobile/core/interfaces/future_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';

/// Deletes an event by its CalDAV URL.
final class DeleteEventUseCase extends FutureUseCaseWithParams<void, String> {
  /// Creates a [DeleteEventUseCase].
  DeleteEventUseCase({required EventRepository eventRepository})
      : _eventRepository = eventRepository;

  final EventRepository _eventRepository;

  @override
  Future<void> invoke(String params) => _eventRepository.deleteEvent(params);
}
