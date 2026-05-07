import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';
import 'app_colors_extension.dart';
import 'design_tokens.dart';

class AppTheme {
  AppTheme._();

  // 使用统一的设计令牌 (Design Tokens)
  static const double _defaultRadius = AppTokens.radiusM;   // 16px
  static const double _containerRadius = AppTokens.radiusL; // 24px

  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      useMaterial3: true,
      // 直接映射设计系统中的全量色盘
      colors: const FlexSchemeColor(
        primary: AppColors.darkPrimary,
        primaryContainer: AppColors.darkPrimaryContainer,
        secondary: AppColors.darkSecondary,
        secondaryContainer: AppColors.darkSecondaryContainer,
        tertiary: AppColors.darkTertiary,
        tertiaryContainer: AppColors.darkTertiaryContainer,
        error: AppColors.darkError,
        errorContainer: AppColors.darkErrorContainer,
      ),
      surface: AppColors.darkSurface,
      scaffoldBackground: AppColors.darkBackground,
      
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
        inputDecoratorFillColor: AppColors.darkSurfaceVariant,
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
      fontFamily: AppTypography.fontFamily,
    ).copyWith(
      splashFactory: NoSplash.splashFactory,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.darkOnSurface,
        displayColor: AppColors.darkOnSurface,
      ),
      extensions: [
        const AppColorsExtension(
          success: AppColors.success,
          warning: AppColors.warning,
          info: AppColors.info,
          extra: AppColors.darkSecondary,
        ),
      ],
    );
  }

  static ThemeData get lightTheme {
    return FlexThemeData.light(
      useMaterial3: true,
      colors: const FlexSchemeColor(
        primary: AppColors.lightPrimary,
        primaryContainer: AppColors.lightPrimaryContainer,
        secondary: AppColors.lightSecondary,
        secondaryContainer: AppColors.lightSecondaryContainer,
        tertiary: AppColors.lightTertiary,
        tertiaryContainer: AppColors.lightTertiaryContainer,
        error: AppColors.lightError,
        errorContainer: AppColors.lightErrorContainer,
      ),
      surface: AppColors.lightSurface,
      scaffoldBackground: AppColors.lightBackground,
      
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
        inputDecoratorFillColor: AppColors.lightSurfaceVariant,
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
      fontFamily: AppTypography.fontFamily,
    ).copyWith(
      splashFactory: NoSplash.splashFactory,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.lightOnSurface,
        displayColor: AppColors.lightOnSurface,
      ),
      extensions: [
        AppColorsExtension(
          success: AppColors.success,
          warning: AppColors.warning,
          info: AppColors.info,
          extra: AppColors.lightSecondary.withValues(alpha: 0.8),
        ),
      ],
    );
  }
}
