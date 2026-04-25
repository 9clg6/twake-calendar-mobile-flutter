import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';

/// Authentication repository.
///
/// Drives the OIDC PKCE flow and the token store.
abstract interface class AuthRepository {
  /// Returns the persisted token if the user is signed in, else null.
  Future<AuthTokenEntity?> currentToken();

  /// Launches the OIDC login flow and returns the resulting token.
  Future<AuthTokenEntity> signIn();

  /// Refreshes the access token using the persisted refresh token.
  Future<AuthTokenEntity> refresh();

  /// Clears the stored token and ends the SSO session.
  Future<void> signOut();
}
