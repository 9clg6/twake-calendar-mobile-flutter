import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twake_calendar_mobile/core/config/app_config_provider.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_controller.dart';
import 'package:twake_calendar_mobile/features/auth/presentation/controllers/auth_state.dart';
import 'package:twake_calendar_mobile/foundation/routing/app_router.dart';

/// [Listenable] bridge between Riverpod and GoRouter so that route guards
/// re-evaluate as soon as the auth state changes.
class _AuthRouterRefresher extends ChangeNotifier {
  _AuthRouterRefresher(Ref<dynamic> ref) {
    ref.listen<AuthState>(
      authControllerProvider,
      (AuthState? previous, AuthState next) {
        if (previous?.isLoggedIn != next.isLoggedIn ||
            previous?.isLoading != next.isLoading) {
          notifyListeners();
        }
      },
    );
  }
}

/// Singleton [GoRouter] of the app.
final Provider<GoRouter> routerProvider = Provider<GoRouter>(
  (Ref<GoRouter> ref) {
    final bool isProd = ref.watch(appConfigProvider).isProd;
    final _AuthRouterRefresher refresh = _AuthRouterRefresher(ref);
    final GoRouter router = GoRouter(
      initialLocation: const SplashRoute().location,
      routes: $appRoutes,
      debugLogDiagnostics: !isProd,
      refreshListenable: refresh,
    );
    ref.onDispose(refresh.dispose);
    return router;
  },
  name: 'routerProvider',
);
