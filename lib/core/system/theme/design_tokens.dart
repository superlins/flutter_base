class AppTokens {
  AppTokens._();

  // --- 圆角令牌 (Radius Tokens) ---
  static const double radiusS = 12.0;
  static const double radiusM = 16.0;
  static const double radiusL = 24.0;
  static const double radiusXL = 32.0;
  static const double radiusFull = 999.0;

  // --- 间距令牌 (Spacing Tokens) ---
  // 基于 8px 栅格系统，使用数值化命名更直观
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
  static const double s48 = 48.0;
  static const double s56 = 56.0;
  static const double s64 = 64.0;
  static const double s72 = 72.0;
  static const double s80 = 80.0;
  static const double s88 = 88.0;
  static const double s96 = 96.0;
  static const double s100 = 100.0;

  // --- 语义化间距 (Semantic Spacing) ---
  static const double spacingScreen = s16; // 统一屏幕外边距
  static const double spacingGutter = s16; // 统一组件内间距

  // --- 描边令牌 (Border Width Tokens) ---
  static const double borderThin = 1.0;
  static const double borderThick = 2.0;

  // --- 动画令牌 (Animation Tokens) ---
  static const Duration durationFast = Duration(milliseconds: 200);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
}
