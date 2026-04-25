import 'package:dio/dio.dart';
import 'package:twake_calendar_mobile/core/logging/log.dart';

/// Returns the current access token, or null if the user is not logged in.
typedef AccessTokenProvider = Future<String?> Function();

/// Callback invoked when the server responds 401 Unauthorized.
///
/// Implementations typically launch the OIDC re-authentication flow.
typedef UnauthorizedHandler = Future<void> Function();

/// Dio interceptor injecting the OIDC bearer token on every request and
/// triggering re-authentication on 401 responses.
final class AuthInterceptor extends Interceptor {
  /// Creates an [AuthInterceptor].
  AuthInterceptor({
    required AccessTokenProvider tokenProvider,
    required UnauthorizedHandler onUnauthorized,
  })  : _tokenProvider = tokenProvider,
        _onUnauthorized = onUnauthorized;

  final AccessTokenProvider _tokenProvider;
  final UnauthorizedHandler _onUnauthorized;
  final Log _log = Log.named('AuthInterceptor');

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await _tokenProvider();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      _log.warning('401 received, triggering re-authentication');
      await _onUnauthorized();
    }
    handler.next(err);
  }
}
