import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/features/search/data/datasources/event_search_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/search/data/endpoints/event_search_endpoint.dart';
import 'package:twake_calendar_mobile/features/search/data/repositories/event_search_repository_impl.dart';
import 'package:twake_calendar_mobile/features/search/domain/repositories/event_search_repository.dart';
import 'package:twake_calendar_mobile/features/search/domain/usecases/search_events_usecase.dart';
import 'package:twake_calendar_mobile/shared/domain/entities/user.dart';
import 'package:twake_calendar_mobile/shared/shared_providers.dart';

/// Search endpoint provider.
final Provider<EventSearchEndpoint> eventSearchEndpointProvider =
    Provider<EventSearchEndpoint>(
  (Ref<EventSearchEndpoint> ref) =>
      EventSearchEndpoint(ref.watch(dioClientProvider).dio),
  name: 'eventSearchEndpointProvider',
);

/// Search remote data source provider.
final Provider<EventSearchRemoteDataSource>
    eventSearchRemoteDataSourceProvider =
    Provider<EventSearchRemoteDataSource>(
  (Ref<EventSearchRemoteDataSource> ref) => EventSearchRemoteDataSourceImpl(
    endpoint: ref.watch(eventSearchEndpointProvider),
  ),
  name: 'eventSearchRemoteDataSourceProvider',
);

/// Search repository provider — async because it needs the current user id.
final FutureProvider<EventSearchRepository> eventSearchRepositoryProvider =
    FutureProvider<EventSearchRepository>(
  (Ref<AsyncValue<EventSearchRepository>> ref) async {
    final UserEntity me = await ref.watch(userRepositoryProvider).fetchCurrentUser();
    return EventSearchRepositoryImpl(
      remoteDataSource: ref.watch(eventSearchRemoteDataSourceProvider),
      currentUserId: me.openpaasId,
    );
  },
  name: 'eventSearchRepositoryProvider',
);

/// `SearchEventsUseCase` provider.
final FutureProvider<SearchEventsUseCase> searchEventsUseCaseProvider =
    FutureProvider<SearchEventsUseCase>(
  (Ref<AsyncValue<SearchEventsUseCase>> ref) async {
    final EventSearchRepository repository =
        await ref.watch(eventSearchRepositoryProvider.future);
    return SearchEventsUseCase(repository: repository);
  },
  name: 'searchEventsUseCaseProvider',
);
