import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';
import 'app_colors_extension.dart';
import 'design_tokens.dart';

class GFAppTheme {
  GFAppTheme._();

  // 使用统一的设计令牌 (Design Tokens)
  static const double _defaultRadius = GFTokens.radiusM;   // 16px
  static const double _containerRadius = GFTokens.radiusL; // 24px

  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      useMaterial3: true,
      // 直接映射设计系统中的全量色盘
      colors: const FlexSchemeColor(
        primary: GFColors.primary,
        primaryContainer: GFColors.primaryContainer,
        secondary: GFColors.secondary,
        secondaryContainer: GFColors.secondaryContainer,
        tertiary: GFColors.tertiary,
        tertiaryContainer: GFColors.tertiaryContainer,
        error: GFColors.error,
        errorContainer: GFColors.errorContainer,
      ),
      surface: GFColors.surface,
      scaffoldBackground: GFColors.background,
      
      // 表面模式配置
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 10,
      
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useMaterial3Typography: true,
        defaultRadius: _defaultRadius,
        
        // 按钮样式
        elevatedButtonSchemeColor: SchemeColor.primary,
        elevatedButtonSecondarySchemeColor: SchemeColor.onPrimary,
        
        // 卡片圆角使用较大的标准 (8px)
        cardRadius: _containerRadius,
        
        // 输入框样式优化
        inputDecoratorIsFilled: true,
        inputDecoratorFillColor: GFColors.surfaceContainerLow,
        inputDecoratorRadius: _defaultRadius,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedBorderIsColored: false,
        inputDecoratorFocusedHasBorder: true,
        inputDecoratorSchemeColor: SchemeColor.onSurface,
        inputDecoratorUnfocusedHasBorder: true,
        
        // 底部导航栏
        bottomNavigationBarElevation: 0,
        bottomNavigationBarOpacity: 0.9,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: GFTypography.fontFamily,
    ).copyWith(
      splashFactory: NoSplash.splashFactory,
      textTheme: GFTypography.textTheme.apply(
        bodyColor: GFColors.onSurface,
        displayColor: GFColors.onSurface,
      ),
      extensions: [
        const AppColorsExtension(
          success: GFColors.success,
          warning: GFColors.warning,
          info: GFColors.statusCyan,
          extra: GFColors.secondary,
        ),
      ],
    );
  }

  static ThemeData get lightTheme {
    return FlexThemeData.light(
      useMaterial3: true,
      colors: const FlexSchemeColor(
        primary: GFColors.lightPrimary,
        primaryContainer: GFColors.lightPrimaryContainer,
        secondary: GFColors.secondary,
        secondaryContainer: Color(0xFFF0DBFF),
        tertiary: Color(0xFF703700),
        tertiaryContainer: Color(0xFFFFDCC5),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
      ),
      surface: GFColors.lightSurface,
      scaffoldBackground: GFColors.lightBackground,
      
      // 浅色模式保持清爽：极低水平的混色
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 2, // 降低混色，保持背景洁白
      
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        useMaterial3Typography: true,
        defaultRadius: _defaultRadius,
        cardRadius: _containerRadius,
        
        // 输入框样式：浅色模式下边框更明显
        inputDecoratorIsFilled: true,
        inputDecoratorFillColor: Color(0xFFF3F4F6),
        inputDecoratorRadius: _defaultRadius,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedBorderIsColored: false,
        inputDecoratorSchemeColor: SchemeColor.onSurface,
        inputDecoratorUnfocusedHasBorder: true,
        
        // 按钮
        elevatedButtonSchemeColor: SchemeColor.primary,
        elevatedButtonSecondarySchemeColor: SchemeColor.onPrimary,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: GFTypography.fontFamily,
    ).copyWith(
      splashFactory: NoSplash.splashFactory,
      textTheme: GFTypography.textTheme.apply(
        bodyColor: GFColors.lightOnSurface,
        displayColor: GFColors.lightOnSurface,
      ),
      extensions: [
        AppColorsExtension(
          success: GFColors.success,
          warning: GFColors.warning,
          info: GFColors.statusCyan,
          extra: GFColors.secondary.withValues(alpha: 0.8),
        ),
      ],
    );
  }
}
