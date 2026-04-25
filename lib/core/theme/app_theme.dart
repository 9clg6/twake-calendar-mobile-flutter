import 'package:flutter/material.dart';
import 'package:twake_calendar_mobile/core/theme/color_tokens.dart';

/// Builds the application themes (light + dark).
abstract final class AppTheme {
  /// Light theme.
  static ThemeData light() {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: ColorTokens.twakeOrange,
      brightness: Brightness.light,
      surface: ColorTokens.background,
      onSurface: ColorTokens.textPrimary,
      primary: ColorTokens.twakeOrange,
      secondary: ColorTokens.textTertiary,
      outline: ColorTokens.divider,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
          fontSize: 22,
          color: ColorTokens.textTertiary,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: ColorTokens.textTertiary),
        bodyMedium: TextStyle(fontSize: 14, color: ColorTokens.textMuted),
        bodySmall: TextStyle(fontSize: 13, color: ColorTokens.textSecondary),
      ),
      dividerTheme: const DividerThemeData(color: ColorTokens.divider),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: ColorTokens.background,
        foregroundColor: ColorTokens.textPrimary,
      ),
    );
  }

  /// Dark theme (placeholder — to be refined when designs land).
  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorTokens.twakeOrange,
          brightness: Brightness.dark,
        ),
      );
}
