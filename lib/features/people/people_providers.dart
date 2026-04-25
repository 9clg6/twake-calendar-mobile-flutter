import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/features/people/data/endpoints/people_search_endpoint.dart';
import 'package:twake_calendar_mobile/features/people/data/repositories/people_repository_impl.dart';
import 'package:twake_calendar_mobile/features/people/domain/repositories/people_repository.dart';

/// People search endpoint provider.
final Provider<PeopleSearchEndpoint> peopleSearchEndpointProvider =
    Provider<PeopleSearchEndpoint>(
  (Ref<PeopleSearchEndpoint> ref) =>
      PeopleSearchEndpoint(ref.watch(dioClientProvider).dio),
  name: 'peopleSearchEndpointProvider',
);

/// People repository provider.
final Provider<PeopleRepository> peopleRepositoryProvider =
    Provider<PeopleRepository>(
  (Ref<PeopleRepository> ref) => PeopleRepositoryImpl(
    endpoint: ref.watch(peopleSearchEndpointProvider),
  ),
  name: 'peopleRepositoryProvider',
);
