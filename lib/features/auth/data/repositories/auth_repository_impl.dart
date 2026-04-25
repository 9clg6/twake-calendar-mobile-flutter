import 'package:twake_calendar_mobile/core/errors/auth_exception.dart';
import 'package:twake_calendar_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:twake_calendar_mobile/features/auth/data/datasources/oidc_remote_datasource.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';

/// Concrete [AuthRepository] orchestrating the OIDC remote source and the
/// secure local storage.
final class AuthRepositoryImpl implements AuthRepository {
  /// Creates an [AuthRepositoryImpl].
  AuthRepositoryImpl({
    required OidcRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final OidcRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<AuthTokenEntity?> currentToken() => _localDataSource.getToken();

  @override
  Future<AuthTokenEntity> signIn() async {
    final AuthTokenEntity token = await _remoteDataSource.authorizeAndExchange();
    await _localDataSource.saveToken(token);
    return token;
  }

  @override
  Future<AuthTokenEntity> refresh() async {
    final AuthTokenEntity? current = await _localDataSource.getToken();
    final String? refreshToken = current?.refreshToken;
    if (refreshToken == null) {
      throw const AuthException('No refresh token available');
    }
    final AuthTokenEntity refreshed =
        await _remoteDataSource.refresh(refreshToken);
    await _localDataSource.saveToken(refreshed);
    return refreshed;
  }

  @override
  Future<void> signOut() async {
    final AuthTokenEntity? current = await _localDataSource.getToken();
    try {
      await _remoteDataSource.endSession(idToken: current?.idToken);
    } catch (_) {
      // Best-effort: even if the SSO end-session fails we want to drop the
      // local credentials so the user is logged out client-side.
    }
    await _localDataSource.clear();
  }
}
