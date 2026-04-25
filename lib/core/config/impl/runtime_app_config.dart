import 'package:twake_calendar_mobile/core/config/app_config.dart';
import 'package:twake_calendar_mobile/core/config/environment.dart';

/// Concrete [AppConfig] reading values from `--dart-define` at compile time.
///
/// All values fall back to safe defaults so the app boots even without
/// configuration (it then targets the example dev environment).
final class RuntimeAppConfig extends AppConfig {
  /// Creates a [RuntimeAppConfig].
  RuntimeAppConfig()
      : super(
          appName: _kAppName,
          env: Environment.fromDefine(_kEnvRaw),
          calendarBaseUrl: _kCalendarBaseUrl,
          ssoBaseUrl: _kSsoBaseUrl,
          ssoClientId: _kSsoClientId,
          ssoScope: _kSsoScope,
          ssoRedirectUri: _kSsoRedirectUri,
          ssoPostLogoutRedirect: _kSsoPostLogoutRedirect,
          webSocketUrl: _kWebSocketUrl,
          wsPingPeriodMs: _kWsPingPeriodMs,
          wsPingTimeoutPeriodMs: _kWsPingTimeoutPeriodMs,
          wsDebouncePeriodMs: _kWsDebouncePeriodMs,
          wsSkipDelayMs: _kWsSkipDelayMs,
        );

  static const String _kAppName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Twake Calendar',
  );

  static const String _kEnvRaw = String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  static const String _kCalendarBaseUrl = String.fromEnvironment(
    'CALENDAR_BASE_URL',
    defaultValue: 'https://calendar.example.com',
  );

  static const String _kSsoBaseUrl = String.fromEnvironment(
    'SSO_BASE_URL',
    defaultValue: 'https://sso.example.com',
  );

  static const String _kSsoClientId = String.fromEnvironment(
    'SSO_CLIENT_ID',
    defaultValue: 'twake-calendar-mobile',
  );

  static const String _kSsoScope = String.fromEnvironment(
    'SSO_SCOPE',
    defaultValue: 'openid profile email',
  );

  static const String _kSsoRedirectUri = String.fromEnvironment(
    'SSO_REDIRECT_URI',
    defaultValue: 'twakecal://callback',
  );

  static const String _kSsoPostLogoutRedirect = String.fromEnvironment(
    'SSO_POST_LOGOUT_REDIRECT',
    defaultValue: 'twakecal://logout',
  );

  static const String _kWebSocketUrl = String.fromEnvironment(
    'WEBSOCKET_URL',
    defaultValue: 'wss://calendar.example.com',
  );

  static const int _kWsPingPeriodMs = int.fromEnvironment(
    'WS_PING_PERIOD_MS',
    defaultValue: 30000,
  );

  static const int _kWsPingTimeoutPeriodMs = int.fromEnvironment(
    'WS_PING_TIMEOUT_PERIOD_MS',
    defaultValue: 35000,
  );

  static const int _kWsDebouncePeriodMs = int.fromEnvironment(
    'WS_DEBOUNCE_PERIOD_MS',
    defaultValue: 0,
  );

  static const int _kWsSkipDelayMs = int.fromEnvironment(
    'WS_SKIP_DELAY_MS',
    defaultValue: 2000,
  );
}
