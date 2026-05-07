import 'package:flutter/material.dart';

class GFColors {
  GFColors._();

  // Background & Surfaces
  static const Color background = Color(0xFF0B1326);
  static const Color surface = Color(0xFF0B1326);
  static const Color surfaceDim = Color(0xFF0B1326);
  static const Color surfaceBright = Color(0xFF31394D);

  // Surface Containers
  static const Color surfaceContainerLowest = Color(0xFF060E20);
  static const Color surfaceContainerLow = Color(0xFF131B2E);
  static const Color surfaceContainer = Color(0xFF171F33);
  static const Color surfaceContainerHigh = Color(0xFF222A3D);
  static const Color surfaceContainerHighest = Color(0xFF2D3449);

  // Primary (Tech Blue)
  static const Color primary = Color(0xFFC0C1FF);
  static const Color onPrimary = Color(0xFF1000A9);
  static const Color primaryContainer = Color(0xFF8083FF);
  static const Color onPrimaryContainer = Color(0xFF0D0096);
  static const Color inversePrimary = Color(0xFF494BD6);

  // Secondary (Cyber Purple)
  static const Color secondary = Color(0xFFDDB7FF);
  static const Color onSecondary = Color(0xFF490080);
  static const Color secondaryContainer = Color(0xFF6F00BE);
  static const Color onSecondaryContainer = Color(0xFFD6A9FF);

  // Tertiary (Status/Accent)
  static const Color tertiary = Color(0xFFFFB783);
  static const Color onTertiary = Color(0xFF4F2500);
  static const Color tertiaryContainer = Color(0xFFD97721);
  static const Color onTertiaryContainer = Color(0xFF452000);

  // Error
  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  // Neutral / Outline
  static const Color onSurface = Color(0xFFDAE2FD);
  static const Color onSurfaceVariant = Color(0xFFC7C4D7);
  static const Color outline = Color(0xFF908FA0);
  static const Color outlineVariant = Color(0xFF464554);

  // Special Status (Status Cyan)
  static const Color statusCyan = Color(0xFF22D3EE);

  // --- Light Mode Palette (Clean White & Gray) ---
  static const Color lightBackground = Color(0xFFF9FAFB); // Very light gray
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF3F4F6);
  static const Color lightPrimary = Color(
    0xFF4F46E5,
  ); // Deeper blue for readability
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFFE0E7FF);
  static const Color lightOnPrimaryContainer = Color(0xFF312E81);
  static const Color lightOutline = Color(0xFFD1D5DB);
  static const Color lightSurfaceContainer = Color(0xFFF3F4F6);
  static const Color lightOnSurface = Color(0xFF111827); // 深灰色/黑色用于文字
  static const Color lightOnSurfaceVariant = Color(0xFF4B5563);

  // --- 兼容性别名 (Aliases for backward compatibility) ---
  static const Color textHigh = onSurface;
  static const Color textMedium = onSurfaceVariant;
  static const Color textLow = outline;
  static const Color accent = statusCyan;
  static const Color success = Color(0xFF10B981); // 保持原有的成功绿
  static const Color warning = Color(0xFFF59E0B);
  static const Color card = surfaceContainer;
  static const Color divider = outlineVariant;
}
