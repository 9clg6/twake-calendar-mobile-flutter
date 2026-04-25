import 'package:flutter/material.dart';

/// Brand color tokens, extracted from the web frontend
/// (`twake-calendar-frontend`).
abstract final class ColorTokens {
  /// Twake accent orange — used on the active sidebar item and highlights.
  static const Color twakeOrange = Color(0xFFF67E35);

  /// Logo gradient start color (top → bottom).
  static const Color logoGradientStart = Color(0xFFFFB73D);

  /// Logo gradient end color.
  static const Color logoGradientEnd = Color(0xFFF26C32);

  /// Primary text color (≈ Material `onSurface`).
  static const Color textPrimary = Color(0xFF000000);

  /// Secondary text color (captions, helper labels).
  static const Color textSecondary = Color(0xFF717D96);

  /// Tertiary text used in the menubar and search results.
  static const Color textTertiary = Color(0xFF243B55);

  /// Subtle text on chips / placeholders.
  static const Color textMuted = Color(0xFF8C9CAF);

  /// Subtle hover background.
  static const Color hoverLight = Color(0xFFF9FAFB);

  /// Stronger hover background (lists).
  static const Color hoverStrong = Color(0xFFE7E7E7);

  /// Lightest divider.
  static const Color divider = Color(0xFFF3F6F9);

  /// Default surface background.
  static const Color background = Color(0xFFFFFFFF);
}
