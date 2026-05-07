import 'package:flutter/foundation.dart';
import '../../config/app_config.dart';

class AppLogger {
  AppLogger._();

  static void debug(String message) {
    if (AppConfig.enableLogging) {
      _print('💬 [DEBUG] $message');
    }
  }

  static void info(String message) {
    _print('ℹ️ [INFO] $message');
  }

  static void warning(String message) {
    _print('⚠️ [WARN] $message');
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _print('🚨 [ERROR] $message');
    if (error != null) {
      _print('  Details: $error');
    }
    if (stackTrace != null) {
      _print('  StackTrace:\n$stackTrace');
    }
  }

  static void _print(String text) {
    if (kDebugMode) {
      // 可以在此处整合第三方如 Sentry/Firebase 等上报逻辑
      print(text);
    }
  }
}
