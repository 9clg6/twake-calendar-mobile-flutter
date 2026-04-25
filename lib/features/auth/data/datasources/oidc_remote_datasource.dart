import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:twake_calendar_mobile/core/config/app_config.dart';
import 'package:twake_calendar_mobile/core/errors/auth_exception.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';

/// Remote data source for the OIDC PKCE flow.
abstract interface class OidcRemoteDataSource {
  /// Launches the authorization + token exchange flow.
  Future<AuthTokenEntity> authorizeAndExchange();

  /// Refreshes the token using a refresh token.
  Future<AuthTokenEntity> refresh(String refreshToken);

  /// Builds the end-session URL (caller is in charge of opening it).
  Future<void> endSession({String? idToken});
}

/// [FlutterAppAuth]-backed implementation.
final class OidcRemoteDataSourceImpl implements OidcRemoteDataSource {
  /// Creates an [OidcRemoteDataSourceImpl].
  OidcRemoteDataSourceImpl({
    required AppConfig config,
    FlutterAppAuth? appAuth,
  })  : _config = config,
        _appAuth = appAuth ?? const FlutterAppAuth();

  final AppConfig _config;
  final FlutterAppAuth _appAuth;

  @override
  Future<AuthTokenEntity> authorizeAndExchange() async {
    final AuthorizationTokenResponse response =
        await _appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _config.ssoClientId,
        _config.ssoRedirectUri,
        discoveryUrl:
            '${_config.ssoBaseUrl}/.well-known/openid-configuration',
        scopes: _config.ssoScope.split(' '),
        promptValues: const <String>['login'],
      ),
    );
    return _toEntity(response);
  }

  @override
  Future<AuthTokenEntity> refresh(String refreshToken) async {
    final TokenResponse response = await _appAuth.token(
      TokenRequest(
        _config.ssoClientId,
        _config.ssoRedirectUri,
        discoveryUrl:
            '${_config.ssoBaseUrl}/.well-known/openid-configuration',
        refreshToken: refreshToken,
        scopes: _config.ssoScope.split(' '),
      ),
    );
    return _toEntity(response);
  }

  @override
  Future<void> endSession({String? idToken}) async {
    await _appAuth.endSession(
      EndSessionRequest(
        idTokenHint: idToken,
        postLogoutRedirectUrl: _config.ssoPostLogoutRedirect,
        discoveryUrl:
            '${_config.ssoBaseUrl}/.well-known/openid-configuration',
      ),
    );
  }

  AuthTokenEntity _toEntity(TokenResponse response) {
    final String? access = response.accessToken;
    if (access == null) {
      throw const AuthException('Missing access token in OIDC response');
    }
    return AuthTokenEntity(
      accessToken: access,
      refreshToken: response.refreshToken,
      idToken: response.idToken,
      expiresAt: response.accessTokenExpirationDateTime,
    );
  }
}
