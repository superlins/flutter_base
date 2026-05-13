import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Inter';

  // Figma Weight Mappings to explicit numeric FontWeights
  static const FontWeight weightThin = FontWeight.w100; // 100: Thin / Hairline
  static const FontWeight weightExtraLight =
      FontWeight.w200; // 200: Extra Light / Ultra Light
  static const FontWeight weightLight = FontWeight.w300; // 300: Light
  static const FontWeight weightRegular =
      FontWeight.w400; // 400: Regular / Normal
  static const FontWeight weightMedium =
      FontWeight.w500; // 500: Medium (Figma 510)
  static const FontWeight weightSemiBold =
      FontWeight.w600; // 600: Semi Bold / Demi Bold
  static const FontWeight weightBold = FontWeight.w700; // 700: Bold
  static const FontWeight weightExtraBold =
      FontWeight.w800; // 800: Extra Bold / Ultra Bold
  static const FontWeight weightBlack = FontWeight.w900; // 900: Black / Heavy

  // 移除了所有硬编码的颜色，让系统根据 ColorScheme 自动适配深浅模式
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: -1.0,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.8,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );
}
