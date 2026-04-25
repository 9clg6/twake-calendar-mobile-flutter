import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/config/app_config_provider.dart';
import 'package:twake_calendar_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:twake_calendar_mobile/features/auth/data/datasources/oidc_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:twake_calendar_mobile/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:twake_calendar_mobile/features/auth/domain/usecases/sign_out_usecase.dart';

/// Singleton secure-storage-backed local data source.
final Provider<AuthLocalDataSource> authLocalDataSourceProvider =
    Provider<AuthLocalDataSource>(
  (Ref<AuthLocalDataSource> ref) => AuthLocalDataSourceImpl(),
  name: 'authLocalDataSourceProvider',
);

/// Singleton OIDC remote data source.
final Provider<OidcRemoteDataSource> oidcRemoteDataSourceProvider =
    Provider<OidcRemoteDataSource>(
  (Ref<OidcRemoteDataSource> ref) => OidcRemoteDataSourceImpl(
    config: ref.watch(appConfigProvider),
  ),
  name: 'oidcRemoteDataSourceProvider',
);

/// Auth repository.
final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>(
  (Ref<AuthRepository> ref) => AuthRepositoryImpl(
    remoteDataSource: ref.watch(oidcRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  ),
  name: 'authRepositoryProvider',
);

/// Sign-in use case.
final Provider<SignInUseCase> signInUseCaseProvider = Provider<SignInUseCase>(
  (Ref<SignInUseCase> ref) =>
      SignInUseCase(authRepository: ref.watch(authRepositoryProvider)),
  name: 'signInUseCaseProvider',
);

/// Sign-out use case.
final Provider<SignOutUseCase> signOutUseCaseProvider =
    Provider<SignOutUseCase>(
  (Ref<SignOutUseCase> ref) =>
      SignOutUseCase(authRepository: ref.watch(authRepositoryProvider)),
  name: 'signOutUseCaseProvider',
);
