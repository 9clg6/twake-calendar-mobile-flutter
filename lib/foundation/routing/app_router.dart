import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:twake_calendar_mobile/features/shared/presentation/screens/calendar_layout_screen.dart';
import 'package:twake_calendar_mobile/features/shared/presentation/screens/error_screen.dart';
import 'package:twake_calendar_mobile/features/shared/presentation/screens/splash_screen.dart';

part 'app_router.g.dart';

/// Initial splash route. Decides where to redirect based on the auth state.
@TypedGoRoute<SplashRoute>(path: '/')
@immutable
class SplashRoute extends GoRouteData with _$SplashRoute {
  /// Creates a [SplashRoute].
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

/// Generic error route, displayed when [GoRouter] cannot resolve a path.
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

/// Main calendar layout route, parent of every authenticated screen.
@TypedGoRoute<CalendarRoute>(path: '/calendar')
@immutable
class CalendarRoute extends GoRouteData with _$CalendarRoute {
  /// Creates a [CalendarRoute].
  const CalendarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CalendarLayoutScreen();
}
