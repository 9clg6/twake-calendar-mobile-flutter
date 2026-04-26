import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:twake_calendar_mobile/core/config/app_config.dart';
import 'package:twake_calendar_mobile/core/config/environment.dart';
import 'package:twake_calendar_mobile/core/network/dio_client.dart';
import 'package:twake_calendar_mobile/core/network/dio_client_provider.dart';
import 'package:twake_calendar_mobile/core/storage/preferences_storage.dart';
import 'package:twake_calendar_mobile/core/storage/preferences_storage_provider.dart';
import 'package:twake_calendar_mobile/features/auth/auth_providers.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/events/events_providers.dart';
import 'package:twake_calendar_mobile/features/settings/data/repositories/preferences_locale_repository.dart';
import 'package:twake_calendar_mobile/foundation/app/twake_calendar_app.dart';

import 'mock_dio_interceptor.dart';

class _StubAuthRepository implements AuthRepository {
  _StubAuthRepository({this.loggedIn = true});

  final bool loggedIn;
  AuthTokenEntity? _stored = const AuthTokenEntity(accessToken: 'stub');

  @override
  Future<AuthTokenEntity?> currentToken() async => loggedIn ? _stored : null;

  @override
  Future<AuthTokenEntity> refresh() async =>
      const AuthTokenEntity(accessToken: 'stub');

  @override
  Future<AuthTokenEntity> signIn() async {
    _stored = const AuthTokenEntity(accessToken: 'stub');
    return _stored!;
  }

  @override
  Future<void> signOut() async {
    _stored = null;
  }
}

class _StubAppConfig extends AppConfig {
  const _StubAppConfig()
      : super(
          appName: 'Twake Calendar (E2E)',
          env: Environment.development,
          calendarBaseUrl: 'https://mock.example.com',
          ssoBaseUrl: 'https://mock-sso.example.com',
          ssoClientId: 'mock-client',
          ssoScope: 'openid profile email',
          ssoRedirectUri: 'twakecal://callback',
          ssoPostLogoutRedirect: 'twakecal://logout',
          webSocketUrl: 'wss://mock.example.com',
          wsPingPeriodMs: 30000,
          wsPingTimeoutPeriodMs: 35000,
          wsDebouncePeriodMs: 0,
          wsSkipDelayMs: 0,
        );
}

DioClient _mockedDio() {
  final DioClient client = DioClient(const _StubAppConfig());
  client.attach(MockBackendInterceptor());
  return client;
}

/// Builds the full Twake Calendar app under a [ProviderScope] with every
/// external dependency replaced by a deterministic mock — perfect for E2E
/// runs on iOS / Android emulators.
Future<Widget> buildE2EApp({bool loggedIn = true}) async {
  tz_data.initializeTimeZones();
  // Pre-seed the stored locale to English so all string finders are stable
  // across the suite — individual tests still drive the locale switch via
  // the settings screen because the real LocaleController is wired in.
  SharedPreferences.setMockInitialValues(<String, Object>{
    PreferencesLocaleRepository.key: 'en',
  });
  final PreferencesStorage prefs = await PreferencesStorage.load();

  return ProviderScope(
    overrides: <Override>[
      preferencesStorageProvider.overrideWith((_) async => prefs),
      authRepositoryProvider.overrideWithValue(
        _StubAuthRepository(loggedIn: loggedIn),
      ),
      dioClientProvider.overrideWithValue(_mockedDio()),
      useFakeCalendarRepositoryProvider.overrideWithValue(false),
      useFakeEventRepositoryProvider.overrideWithValue(false),
    ],
    child: const TwakeCalendarApp(),
  );
}
