import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_controller.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_state.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:twake_calendar_mobile/features/calendar_view/presentation/screens/calendar_layout_screen.dart';
import 'package:twake_calendar_mobile/features/calendars/presentation/screens/sidebar_screen.dart';
import 'package:twake_calendar_mobile/features/events/presentation/screens/event_form_screen.dart';
import 'package:twake_calendar_mobile/features/search/presentation/screens/search_screen.dart';
import 'package:twake_calendar_mobile/features/settings/presentation/screens/settings_home_screen.dart';
import 'package:twake_calendar_mobile/features/shared/presentation/screens/error_screen.dart';
import 'package:twake_calendar_mobile/features/shared/presentation/screens/splash_screen.dart';
import 'package:twake_calendar_mobile/features/sync/presentation/screens/conflict_resolution_screen.dart';

part 'app_router.g.dart';

/// Reads the synchronous auth status from the [authControllerProvider]
/// container attached to [context]. `redirect` callbacks must stay
/// synchronous, so this helper is the only way to peek at the state from a
/// `GoRouteData.redirect`.
AuthState _readAuth(BuildContext context) =>
    ProviderScope.containerOf(context).read(authControllerProvider);

/// Initial splash route. Redirects to login when no token is available, to
/// the calendar layout otherwise.
@TypedGoRoute<SplashRoute>(path: '/')
@immutable
class SplashRoute extends GoRouteData with _$SplashRoute {
  /// Creates a [SplashRoute].
  const SplashRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final AuthState auth = _readAuth(context);
    if (auth.isLoading) return null;
    return auth.isLoggedIn
        ? const CalendarRoute().location
        : const LoginRoute().location;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

/// Login route — drives the OIDC sign-in flow.
@TypedGoRoute<LoginRoute>(path: '/login')
@immutable
class LoginRoute extends GoRouteData with _$LoginRoute {
  /// Creates a [LoginRoute].
  const LoginRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final AuthState auth = _readAuth(context);
    return auth.isLoggedIn ? const CalendarRoute().location : null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}

/// Generic error route.
@TypedGoRoute<ErrorRoute>(path: '/error')
@immutable
class ErrorRoute extends GoRouteData with _$ErrorRoute {
  /// Creates an [ErrorRoute].
  const ErrorRoute({this.message});

  /// Optional message passed via query parameters.
  final String? message;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ErrorScreen(message: message);
}

/// Main calendar layout (month view).
@TypedGoRoute<CalendarRoute>(
  path: '/calendar',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SidebarRoute>(path: 'sidebar'),
    TypedGoRoute<SearchRoute>(path: 'search'),
    TypedGoRoute<SettingsRoute>(path: 'settings'),
    TypedGoRoute<ConflictsRoute>(path: 'conflicts'),
    TypedGoRoute<EventCreateRoute>(path: 'events/new'),
  ],
)
@immutable
class CalendarRoute extends GoRouteData with _$CalendarRoute {
  /// Creates a [CalendarRoute].
  const CalendarRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final AuthState auth = _readAuth(context);
    if (auth.isLoading) return null;
    return auth.isLoggedIn ? null : const LoginRoute().location;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalendarLayoutScreen();
}

/// Sidebar (calendars list) — pushed from the month view app bar.
@immutable
class SidebarRoute extends GoRouteData with _$SidebarRoute {
  /// Creates a [SidebarRoute].
  const SidebarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SidebarScreen();
}

/// Settings home route — accessible from the calendar layout app bar.
@immutable
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  /// Creates a [SettingsRoute].
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsHomeScreen();
}

/// Search route — events search backed by the side-service endpoint.
@immutable
class SearchRoute extends GoRouteData with _$SearchRoute {
  /// Creates a [SearchRoute].
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SearchScreen();
}

/// Conflicts route — pending sync conflicts awaiting user resolution.
@immutable
class ConflictsRoute extends GoRouteData with _$ConflictsRoute {
  /// Creates a [ConflictsRoute].
  const ConflictsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ConflictResolutionScreen();
}

/// Event create route — opens an empty event form.
@immutable
class EventCreateRoute extends GoRouteData with _$EventCreateRoute {
  /// Creates an [EventCreateRoute].
  const EventCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EventFormScreen();
}
