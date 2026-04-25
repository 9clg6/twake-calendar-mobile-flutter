import 'package:flutter/material.dart';
import 'package:twake_calendar_mobile/l10n/app_localizations.dart';

/// Convenience extensions on [BuildContext] for theme + localization access.
extension BuildContextX on BuildContext {
  /// Localized strings (cf. `lib/l10n/`).
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Active [ColorScheme].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Active [TextTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Whether the active theme is in dark mode.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
