import 'package:flutter/material.dart';

import 'app_error.dart';

/// 通用错误信息扩展，挂载到 ThemeExtension
class ErrorColors extends ThemeExtension<ErrorColors> {
  final Color info;
  final Color warning;
  final Color error;
  final Color success;

  const ErrorColors({
    required this.info,
    required this.warning,
    required this.error,
    required this.success,
  });

  factory ErrorColors.defaults() => const ErrorColors(
        info: Color(0xFF1976D2),
        warning: Color(0xFFFF9800),
        error: Color(0xFFD32F2F),
        success: Color(0xFF2E7D32),
      );

  @override
  ErrorColors copyWith({Color? info, Color? warning, Color? error, Color? success}) {
    return ErrorColors(
      info: info ?? this.info,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      success: success ?? this.success,
    );
  }

  @override
  ErrorColors lerp(ThemeExtension<ErrorColors>? other, double t) {
    if (other is! ErrorColors) return this;
    return ErrorColors(
      info: Color.lerp(info, other.info, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}

/// 全局错误提示工具
class AppErrorHandler {
  static void showSnackBar(BuildContext context, AppError error) {
    final theme = Theme.of(context);
    final colors = theme.extension<ErrorColors>();
    final color = error.isError
        ? colors?.error ?? Colors.red
        : colors?.warning ?? Colors.orange;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.displayMessage),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: error.isError ? const Duration(seconds: 4) : const Duration(seconds: 2),
        action: error.actionLabel != null
            ? SnackBarAction(
                label: error.actionLabel!,
                textColor: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  error.onAction?.call();
                },
              )
            : null,
      ),
    );
  }

  static void showInfo(BuildContext context, String message) {
    showSnackBar(context, AppError.info(message));
  }

  static void showWarning(BuildContext context, String message) {
    showSnackBar(context, AppError.warning(message));
  }

  static void showError(BuildContext context, String message, {String? actionLabel, VoidCallback? onAction}) {
    showSnackBar(context, AppError.error(message, actionLabel: actionLabel, onAction: onAction));
  }
}
