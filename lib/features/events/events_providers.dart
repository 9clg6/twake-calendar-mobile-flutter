import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/ical/jcal_codec.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/features/events/data/datasources/caldav_event_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/events/data/endpoints/caldav_event_endpoint.dart';
import 'package:twake_calendar_mobile/features/events/data/repositories/event_repository_impl.dart';
import 'package:twake_calendar_mobile/features/events/data/repositories/fake_event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/repositories/event_repository.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/delete_event_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/get_events_in_range_usecase.dart';
import 'package:twake_calendar_mobile/features/events/domain/usecases/save_event_usecase.dart';

/// jCal codec singleton (parser + builder, stateless).
final Provider<JCalCodec> jcalCodecProvider = Provider<JCalCodec>(
  (Ref<JCalCodec> ref) => const JCalCodec(),
  name: 'jcalCodecProvider',
);

/// CalDAV event endpoint provider.
final Provider<CaldavEventEndpoint> caldavEventEndpointProvider =
    Provider<CaldavEventEndpoint>(
  (Ref<CaldavEventEndpoint> ref) =>
      CaldavEventEndpoint(ref.watch(dioClientProvider).dio),
  name: 'caldavEventEndpointProvider',
);

/// CalDAV event remote data source provider.
final Provider<CaldavEventRemoteDataSource>
    caldavEventRemoteDataSourceProvider =
    Provider<CaldavEventRemoteDataSource>(
  (Ref<CaldavEventRemoteDataSource> ref) => CaldavEventRemoteDataSourceImpl(
    endpoint: ref.watch(caldavEventEndpointProvider),
  ),
  name: 'caldavEventRemoteDataSourceProvider',
);

/// Toggle between [FakeEventRepository] and the real CalDAV-backed
/// [EventRepositoryImpl]. Override in tests / dev runs:
/// `useFakeEventRepositoryProvider.overrideWithValue(true)`.
final Provider<bool> useFakeEventRepositoryProvider = Provider<bool>(
  (Ref<bool> ref) => false,
  name: 'useFakeEventRepositoryProvider',
);

/// Event repository provider — fake when the toggle is set, CalDAV-backed
/// otherwise.
final Provider<EventRepository> eventRepositoryProvider =
    Provider<EventRepository>(
  (Ref<EventRepository> ref) {
    if (ref.watch(useFakeEventRepositoryProvider)) {
      return const FakeEventRepository();
    }
    return EventRepositoryImpl(
      remoteDataSource: ref.watch(caldavEventRemoteDataSourceProvider),
      jcalCodec: ref.watch(jcalCodecProvider),
    );
  },
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

/// `SaveEventUseCase` provider.
final Provider<SaveEventUseCase> saveEventUseCaseProvider =
    Provider<SaveEventUseCase>(
  (Ref<SaveEventUseCase> ref) => SaveEventUseCase(
    eventRepository: ref.watch(eventRepositoryProvider),
  ),
  name: 'saveEventUseCaseProvider',
);

/// `DeleteEventUseCase` provider.
final Provider<DeleteEventUseCase> deleteEventUseCaseProvider =
    Provider<DeleteEventUseCase>(
  (Ref<DeleteEventUseCase> ref) => DeleteEventUseCase(
    eventRepository: ref.watch(eventRepositoryProvider),
  ),
  name: 'deleteEventUseCaseProvider',
);
