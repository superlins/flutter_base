import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/router/router.dart';
import '../../core/error/app_exception.dart';
import '../../l10n/app_localizations.dart';

/// 全局异常统一处理器
class AppErrorHandler {
  AppErrorHandler._();

  /// 集中处理/上报异常，并向用户展示对应的 UI 提示
  static void handle(Object error, [StackTrace? stackTrace]) {
    // 1. 本地控制台输出（未来可接入 Sentry/Crashlytics 等 APM 服务进行上报）
    debugPrint('🚨 [Global Error Handled] Error: $error\n$stackTrace');

    // 2. 界面展示分发（确保在 Microtask 队列中执行，规避 build 阶段弹窗冲突）
    Future.microtask(() {
      final context = rootNavigatorKey.currentContext;
      if (context == null || !context.mounted) return;

      final l10n = AppLocalizations.of(context);
      if (l10n == null) return;

      final message = error is AppException
          ? error.localizedMessage(l10n)
          : error.toString();

      final severity = error is AppException
          ? error.severity
          : AppErrorSeverity.toast;

      switch (severity) {
        case AppErrorSeverity.fullscreen:
          // TODO: 真正实现全屏错误页后，这里应跳转路由。目前降级为 toast 提示，确保不静默失败。
          debugPrint(
            '⚠️ [Fullscreen Error] Redirect not implemented, falling back to toast.',
          );
          continue toastLabel;
        toastLabel:
        case AppErrorSeverity.toast:
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Theme.of(context).colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
          break;
      }
    });
  }
}

/// 监听 Riverpod Provider 异常的观察器
base class AppProviderObserver extends ProviderObserver {
  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    AppErrorHandler.handle(error, stackTrace);
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final providerName = context.provider.name ?? context.provider.runtimeType;

    if (newValue is AsyncValue && newValue.hasError) {
      debugPrint(
        '📝 [Provider Update Error] $providerName: ${newValue.error}',
      );
    } else {
      debugPrint('🔄 [Provider Updated] $providerName');
    }
  }
}
