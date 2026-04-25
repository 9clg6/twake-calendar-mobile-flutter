import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/theme/app_theme.dart';
import 'package:twake_calendar_mobile/features/auth/auth_providers.dart';
import 'package:twake_calendar_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:twake_calendar_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:twake_calendar_mobile/features/calendars/calendars_providers.dart';
import 'package:twake_calendar_mobile/features/events/events_providers.dart';
import 'package:twake_calendar_mobile/foundation/routing/router_provider.dart';
import 'package:twake_calendar_mobile/l10n/app_localizations.dart';

class _StubAuthRepository implements AuthRepository {
  _StubAuthRepository({this.loggedIn = true});

  final bool loggedIn;

  @override
  Future<AuthTokenEntity?> currentToken() async => loggedIn
      ? const AuthTokenEntity(accessToken: 'stub')
      : null;

  @override
  Future<AuthTokenEntity> refresh() async =>
      const AuthTokenEntity(accessToken: 'stub');

  @override
  Future<AuthTokenEntity> signIn() async =>
      const AuthTokenEntity(accessToken: 'stub');

  @override
  Future<void> signOut() async {}
}

/// Builds a self-contained test app with the fake calendar/event
/// repositories enabled, the auth repository stubbed, and the standard
/// theme + localizations + router configured.
///
/// Use [loggedIn] to control the redirect behaviour of [SplashRoute].
Widget buildTestApp({bool loggedIn = true}) {
  return ProviderScope(
    overrides: <Override>[
      useFakeCalendarRepositoryProvider.overrideWithValue(true),
      useFakeEventRepositoryProvider.overrideWithValue(true),
      authRepositoryProvider.overrideWithValue(
        _StubAuthRepository(loggedIn: loggedIn),
      ),
    ],
    child: Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        return MaterialApp.router(
          title: 'Twake Calendar (test)',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: ref.watch(routerProvider),
        );
      },
    ),
  );
}
