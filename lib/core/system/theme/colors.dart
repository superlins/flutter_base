import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- Apple iOS Light Mode Palette ---
  static const Color lightBackground = Color(0xFFF2F2F7); // System Grouped Background
  static const Color lightSurface = Color(0xFFFFFFFF); // Secondary System Grouped Background
  static const Color lightSurfaceVariant = Color(0xFFE5E5EA); // Tertiary System Grouped Background
  
  static const Color lightPrimary = Color(0xFF007AFF); // iOS Blue
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFFE5F1FF);
  
  static const Color lightSecondary = Color(0xFF5856D6); // iOS Indigo
  static const Color lightSecondaryContainer = Color(0xFFEAE9FC);

  static const Color lightTertiary = Color(0xFFFF2D55); // iOS Pink
  static const Color lightTertiaryContainer = Color(0xFFFFE5EA);

  static const Color lightError = Color(0xFFFF3B30); // iOS Red
  static const Color lightErrorContainer = Color(0xFFFFD8D6);

  static const Color lightOnSurface = Color(0xFF000000); // Label
  static const Color lightOnSurfaceVariant = Color(0xFF8A8A8E); // Secondary Label
  static const Color lightOutline = Color(0xFFC6C6C8); // Opaque Separator

  // --- Apple iOS Dark Mode Palette ---
  static const Color darkBackground = Color(0xFF000000); // System Background
  static const Color darkSurface = Color(0xFF1C1C1E); // Secondary System Background
  static const Color darkSurfaceVariant = Color(0xFF2C2C2E); // Tertiary System Background

  static const Color darkPrimary = Color(0xFF0A84FF); // iOS Blue
  static const Color darkOnPrimary = Color(0xFFFFFFFF);
  static const Color darkPrimaryContainer = Color(0xFF004080);
  
  static const Color darkSecondary = Color(0xFF5E5CE6); // iOS Indigo
  static const Color darkSecondaryContainer = Color(0xFF2E2C73);

  static const Color darkTertiary = Color(0xFFFF375F); // iOS Pink
  static const Color darkTertiaryContainer = Color(0xFF801A2F);

  static const Color darkError = Color(0xFFFF453A); // iOS Red
  static const Color darkErrorContainer = Color(0xFF7A1B14);

  static const Color darkOnSurface = Color(0xFFFFFFFF); // Label
  static const Color darkOnSurfaceVariant = Color(0xFF8E8E93); // Secondary Label
  static const Color darkOutline = Color(0xFF38383A); // Opaque Separator

  // --- Shared / Status ---
  static const Color success = Color(0xFF34C759); // iOS Green
  static const Color warning = Color(0xFFFF9500); // iOS Orange
  static const Color info = Color(0xFF5AC8FA); // iOS Teal
}
