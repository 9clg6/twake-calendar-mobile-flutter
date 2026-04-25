import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twake_calendar_mobile/core/config/app_config_provider.dart';
import 'package:twake_calendar_mobile/core/theme/app_theme.dart';
import 'package:twake_calendar_mobile/features/settings/presentation/controllers/locale_controller.dart';
import 'package:twake_calendar_mobile/foundation/routing/router_provider.dart';
import 'package:twake_calendar_mobile/l10n/app_localizations.dart';

/// Root widget of the application.
///
/// Wraps [MaterialApp.router] with the active theme, the localized strings
/// (ARB) and the routing configuration. The actual provider scope is
/// installed in `main.dart`.
class TwakeCalendarApp extends ConsumerWidget {
  /// Creates a [TwakeCalendarApp].
  const TwakeCalendarApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String appName = ref.watch(appConfigProvider).appName;
    final Locale? locale = ref.watch(localeControllerProvider).valueOrNull;
    return MaterialApp.router(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
