import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/shared/data/datasources/user_remote_datasource.dart';
import 'package:twake_calendar_mobile/shared/data/endpoints/user_endpoint.dart';
import 'package:twake_calendar_mobile/shared/data/repositories/user_repository_impl.dart';
import 'package:twake_calendar_mobile/shared/domain/repositories/user_repository.dart';

/// User endpoint provider.
final Provider<UserEndpoint> userEndpointProvider = Provider<UserEndpoint>(
  (Ref<UserEndpoint> ref) => UserEndpoint(ref.watch(dioClientProvider).dio),
  name: 'userEndpointProvider',
);

/// User remote data source provider.
final Provider<UserRemoteDataSource> userRemoteDataSourceProvider =
    Provider<UserRemoteDataSource>(
  (Ref<UserRemoteDataSource> ref) => UserRemoteDataSourceImpl(
    endpoint: ref.watch(userEndpointProvider),
  ),
  name: 'userRemoteDataSourceProvider',
);

/// User repository provider.
final Provider<UserRepository> userRepositoryProvider =
    Provider<UserRepository>(
  (Ref<UserRepository> ref) => UserRepositoryImpl(
    remoteDataSource: ref.watch(userRemoteDataSourceProvider),
  ),
  name: 'userRepositoryProvider',
);
