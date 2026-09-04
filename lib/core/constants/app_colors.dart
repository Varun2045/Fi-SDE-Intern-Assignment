import 'package:flutter/material.dart';

/// 1Fi Design System Colors extracted from official 1Fi App reference screens
class AppColors {
  // 1Fi Brand Purples
  static const Color primary = Color(0xFF5E17EB);       // 1Fi Signature Purple
  static const Color primaryDark = Color(0xFF3F0DA8);   // Dark Violet
  static const Color primaryLight = Color(0xFF8344FF);  // Electric Lavender
  static const Color primaryGlow = Color(0x1F5E17EB);
  static const Color primarySoft = Color(0xFFF3E8FF);

  // Secondary Accents
  static const Color secondary = Color(0xFF00B4D8);
  static const Color accentGreen = Color(0xFF00C853);   // Limit Available Green
  static const Color accentGreenLight = Color(0xFFE8F5E9);
  static const Color accentGold = Color(0xFFFFB703);
  static const Color accentOrange = Color(0xFFFB8500);

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF8F9FD);   // App Light Canvas
  static const Color surface = Color(0xFFFFFFFF);      // Card White
  static const Color surfaceElevated = Color(0xFFF1F3F9);
  static const Color surfaceLight = Color(0xFFE5E7EB);
  static const Color cardBorder = Color(0xFFEDE9FE);    // Subtle Purple/Gray border
  static const Color cardBorderHover = Color(0xFFCBD5E1);
  static const Color cardBorderLight = Color(0xFFF3F4F6);

  // Text Colors
  static const Color textPrimary = Color(0xFF111827);   // Bold Dark Neutral
  static const Color textSecondary = Color(0xFF6B7280); // Slate Subtitle
  static const Color textMuted = Color(0xFF9CA3AF);     // Caption Gray
  static const Color textDisabled = Color(0xFFD1D5DB);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color successBackground = Color(0x1A10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color errorBackground = Color(0xFFFEE2E2);

  // 1Fi Hero Purple Gradient
  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF4311A7), Color(0xFF26056B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardPurpleGradient = LinearGradient(
    colors: [Color(0xFF6318ED), Color(0xFF4B10BC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
