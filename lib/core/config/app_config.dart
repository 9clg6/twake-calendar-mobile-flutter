import 'package:twake_calendar_mobile/core/config/environment.dart';

/// Runtime configuration of the application.
///
/// Mirrors the `window.*` variables of the web frontend (CALENDAR_BASE_URL,
/// SSO_*, WEBSOCKET_URL, WS_*_MS). Provided at app boot via `--dart-define`
/// and exposed through Riverpod.
abstract class AppConfig {
  /// Creates an [AppConfig].
  const AppConfig({
    required this.appName,
    required this.env,
    required this.calendarBaseUrl,
    required this.ssoBaseUrl,
    required this.ssoClientId,
    required this.ssoScope,
    required this.ssoRedirectUri,
    required this.ssoPostLogoutRedirect,
    required this.webSocketUrl,
    required this.wsPingPeriodMs,
    required this.wsPingTimeoutPeriodMs,
    required this.wsDebouncePeriodMs,
    required this.wsSkipDelayMs,
  });

  /// Current environment.
  final Environment env;

  /// Display name of the application.
  final String appName;

  /// Base URL for the side-service + CalDAV reverse-proxy.
  final String calendarBaseUrl;

  /// OIDC issuer / discovery base URL.
  final String ssoBaseUrl;

  /// OIDC client identifier.
  final String ssoClientId;

  /// OIDC scopes (space separated, e.g. `'openid profile email'`).
  final String ssoScope;

  /// OIDC redirect URI used after successful authorization.
  final String ssoRedirectUri;

  /// OIDC redirect URI used after logout.
  final String ssoPostLogoutRedirect;

  /// WebSocket base URL (`ws://` or `wss://`).
  final String webSocketUrl;

  /// Period between two outbound `ping` frames, in milliseconds.
  final int wsPingPeriodMs;

  /// Maximum delay to wait for a `pong` response before reconnecting.
  final int wsPingTimeoutPeriodMs;

  /// Debounce period for batched calendar refresh notifications.
  final int wsDebouncePeriodMs;

  /// Delay before applying a calendar sync triggered by a remote update.
  final int wsSkipDelayMs;

  /// Whether the current build targets production.
  bool get isProd => env == Environment.production;
}
