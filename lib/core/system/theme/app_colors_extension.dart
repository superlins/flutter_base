import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color success;
  final Color warning;
  final Color info;
  final Color extra; // e.g. for custom design elements

  const AppColorsExtension({
    required this.success,
    required this.warning,
    required this.info,
    required this.extra,
  });

  @override
  AppColorsExtension copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? extra,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      extra: extra ?? this.extra,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      extra: Color.lerp(extra, other.extra, t)!,
    );
  }
}

// 方便访问的扩展
extension AppColorsExtensionHelper on ThemeData {
  AppColorsExtension get appColors => extension<AppColorsExtension>()!;
}
