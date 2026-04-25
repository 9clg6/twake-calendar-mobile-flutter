import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/features/events/data/repositories/fake_event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/get_events_in_range_usecase.dart';

/// Event repository provider.
///
/// Currently bound to [FakeEventRepository]. Once the CalDAV event endpoint
/// lands the production binding moves here.
final Provider<EventRepository> eventRepositoryProvider =
    Provider<EventRepository>(
  (Ref<EventRepository> ref) => const FakeEventRepository(),
  name: 'eventRepositoryProvider',
);

/// `GetEventsInRangeUseCase` provider.
final Provider<GetEventsInRangeUseCase> getEventsInRangeUseCaseProvider =
    Provider<GetEventsInRangeUseCase>(
  (Ref<GetEventsInRangeUseCase> ref) => GetEventsInRangeUseCase(
    eventRepository: ref.watch(eventRepositoryProvider),
  ),
  name: 'getEventsInRangeUseCaseProvider',
);
