import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twake_calendar_mobile/core/config/app_config_provider.dart';
import 'package:twake_calendar_mobile/foundation/routing/app_router.dart';

/// Singleton [GoRouter] of the app.
final Provider<GoRouter> routerProvider = Provider<GoRouter>(
  (Ref<GoRouter> ref) {
    final bool isProd = ref.watch(appConfigProvider).isProd;
    return GoRouter(
      initialLocation: const SplashRoute().location,
      routes: $appRoutes,
      debugLogDiagnostics: !isProd,
    );
  },
  name: 'routerProvider',
);
