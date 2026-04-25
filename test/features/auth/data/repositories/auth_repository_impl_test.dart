import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:twake_calendar_mobile/core/errors/auth_exception.dart';
import 'package:twake_calendar_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';

import '../../../../_helpers/mocks.dart';

const AuthTokenEntity _kFreshToken = AuthTokenEntity(accessToken: 'fresh');

void main() {
  late MockOidcRemoteDataSource remote;
  late MockAuthLocalDataSource local;
  late AuthRepositoryImpl repository;

  setUpAll(registerCommonFallbacks);

  setUp(() {
    remote = MockOidcRemoteDataSource();
    local = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
    );
  });

  group('signIn', () {
    test('persists the token returned by the remote data source', () async {
      when(remote.authorizeAndExchange).thenAnswer((_) async => _kFreshToken);
      when(() => local.saveToken(any())).thenAnswer((_) async {});

      await repository.signIn();

      verify(() => local.saveToken(_kFreshToken)).called(1);
    });

    test('returns the token from the remote data source', () async {
      when(remote.authorizeAndExchange).thenAnswer((_) async => _kFreshToken);
      when(() => local.saveToken(any())).thenAnswer((_) async {});

      final AuthTokenEntity result = await repository.signIn();

      expect(result, _kFreshToken);
    });

    test('does not persist when the remote call fails', () async {
      when(remote.authorizeAndExchange)
          .thenThrow(const AuthException('SSO down'));

      await expectLater(
        repository.signIn(),
        throwsA(isA<AuthException>()),
      );
      verifyNever(() => local.saveToken(any()));
    });
  });

  group('refresh', () {
    test('throws when no refresh token is stored', () async {
      when(local.getToken)
          .thenAnswer((_) async => const AuthTokenEntity(accessToken: 'old'));

      await expectLater(repository.refresh(), throwsA(isA<AuthException>()));
    });

    test('refreshes via the remote data source when refresh token exists',
        () async {
      when(local.getToken).thenAnswer((_) async =>
          const AuthTokenEntity(accessToken: 'old', refreshToken: 'rt'));
      when(() => remote.refresh(any())).thenAnswer((_) async => _kFreshToken);
      when(() => local.saveToken(any())).thenAnswer((_) async {});

      final AuthTokenEntity result = await repository.refresh();

      expect(result, _kFreshToken);
    });

    test('persists the refreshed token', () async {
      when(local.getToken).thenAnswer((_) async =>
          const AuthTokenEntity(accessToken: 'old', refreshToken: 'rt'));
      when(() => remote.refresh(any())).thenAnswer((_) async => _kFreshToken);
      when(() => local.saveToken(any())).thenAnswer((_) async {});

      await repository.refresh();

      verify(() => local.saveToken(_kFreshToken)).called(1);
    });
  });

  group('signOut', () {
    test('clears the local token', () async {
      when(local.getToken).thenAnswer((_) async => null);
      when(() => remote.endSession(idToken: any(named: 'idToken')))
          .thenAnswer((_) async {});
      when(local.clear).thenAnswer((_) async {});

      await repository.signOut();

      verify(local.clear).called(1);
    });

    test('still clears local token when end-session fails', () async {
      when(local.getToken).thenAnswer((_) async => null);
      when(() => remote.endSession(idToken: any(named: 'idToken')))
          .thenThrow(const AuthException('SSO unreachable'));
      when(local.clear).thenAnswer((_) async {});

      await repository.signOut();

      verify(local.clear).called(1);
    });

    test('forwards the idToken to the remote end-session call', () async {
      when(local.getToken).thenAnswer((_) async =>
          const AuthTokenEntity(accessToken: 'a', idToken: 'idtok'));
      when(() => remote.endSession(idToken: any(named: 'idToken')))
          .thenAnswer((_) async {});
      when(local.clear).thenAnswer((_) async {});

      await repository.signOut();

      verify(() => remote.endSession(idToken: 'idtok')).called(1);
    });
  });
}
