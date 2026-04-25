import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';

/// OIDC token bundle persisted across sessions.
///
/// Mirrors the `tokenSet` object stored by the web frontend in
/// `sessionStorage`. On mobile, we store it in [FlutterSecureStorage].
@freezed
abstract class AuthTokenEntity with _$AuthTokenEntity {
  /// Creates an [AuthTokenEntity].
  const factory AuthTokenEntity({
    required String accessToken,
    String? refreshToken,
    String? idToken,
    DateTime? expiresAt,
  }) = _AuthTokenEntity;

  const AuthTokenEntity._();

  /// Whether the access token is still valid (with a 30 s safety margin).
  bool get isExpired {
    final DateTime? expires = expiresAt;
    if (expires == null) return false;
    return DateTime.now().add(const Duration(seconds: 30)).isAfter(expires);
  }
}
