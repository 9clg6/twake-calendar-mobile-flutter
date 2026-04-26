import 'package:flutter/material.dart';
import 'package:twake_calendar_mobile/core/theme/color_tokens.dart';

/// Builds the application themes (light + dark) — pixel-aligned with the
/// web frontend (`@linagora/twake-mui` overrides).
abstract final class AppTheme {
  /// Body font — Inter is the web's primary text family.
  static const String _bodyFont = 'Inter';

  /// Calendar / date font — Roboto is the web's secondary family for
  /// dates and the agenda.
  static const String _dateFont = 'Roboto';

  /// Logo font — Cal Sans is only used on the brand wordmark.
  static const String logoFont = 'CalSans';

  /// Light theme (Material 3 with explicit Twake tokens).
  static ThemeData light() {
    const ColorScheme scheme = ColorScheme(
      brightness: Brightness.light,
      primary: ColorTokens.twakeOrange,
      onPrimary: Colors.white,
      secondary: ColorTokens.textTertiary,
      onSecondary: Colors.white,
      tertiary: ColorTokens.textMuted,
      onTertiary: Colors.white,
      error: Color(0xFFB3261E),
      onError: Colors.white,
      surface: ColorTokens.background,
      onSurface: ColorTokens.textPrimary,
      surfaceContainerHighest: ColorTokens.divider,
      outline: ColorTokens.divider,
      outlineVariant: ColorTokens.divider,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: _bodyFont,
      scaffoldBackgroundColor: scheme.surface,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        // Logo — Cal Sans 28.07/100% (Menubar.styl).
        displayLarge: TextStyle(
          fontFamily: logoFont,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1.0,
        ),
        // Date courante Menubar / M3BodyLarge — Roboto 22/28 #243B55.
        headlineMedium: TextStyle(
          fontFamily: _dateFont,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          height: 28 / 22,
          color: ColorTokens.textTertiary,
        ),
        // Settings tabs (desktop) — 24/600 #424244E5.
        titleLarge: TextStyle(
          fontFamily: _bodyFont,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xE5424244),
        ),
        // Settings tabs (mobile) — 17/600.
        titleMedium: TextStyle(
          fontFamily: _bodyFont,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        // M3BodyMedium1 — Inter 16/24 #243B55.
        bodyLarge: TextStyle(
          fontFamily: _bodyFont,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 24 / 16,
          color: ColorTokens.textTertiary,
        ),
        // M3BodyMedium — Roboto 14/20 #8C9CAF.
        bodyMedium: TextStyle(
          fontFamily: _dateFont,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
          color: ColorTokens.textMuted,
        ),
        // Caption — 13 #717D96.
        bodySmall: TextStyle(
          fontFamily: _bodyFont,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: ColorTokens.textSecondary,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: ColorTokens.divider,
        space: 1,
        thickness: 1,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: ColorTokens.background,
        foregroundColor: ColorTokens.textPrimary,
        titleTextStyle: TextStyle(
          fontFamily: _bodyFont,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: ColorTokens.textPrimary,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: ColorTokens.twakeOrange,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorTokens.twakeOrange,
        foregroundColor: Colors.white,
      ),
    );
  }

  /// Dark theme — derived from the light tokens with brightness inverted.
  /// The web has no dark mode, so we approximate with a sensible default.
  static ThemeData dark() {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: ColorTokens.twakeOrange,
      brightness: Brightness.dark,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: _bodyFont,
    );
  }
}
