import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../core/router/router.dart';
import '../../core/error/app_exception.dart';
import '../../l10n/app_localizations.dart';

/// 📦 统一业务异常解析视图模型 (Spring MVP 架构思想，类似 ErrorResponse)
/// 汇聚了异常向 UI 渲染层投送所需的所有标准化展示数据（信息、图标、推荐展示策略）。
class AppErrorUiModel {
  final String message;
  final AppErrorSeverity severity;
  final AppException originalException;

  const AppErrorUiModel({
    required this.message,
    required this.severity,
    required this.originalException,
  });
}

/// 全局异常统一处理器
class AppErrorHandler {
  AppErrorHandler._();

  /// 🛡️ 集中式异常翻译解析器 (Spring `HandlerExceptionResolver` 思想)
  /// 将源头上报的任意 Object 统一翻译为对用户极度友好的本地化 UI 模型，彻底收束国际化与评级逻辑。
  static AppErrorUiModel resolve(Object error, BuildContext context) {
    final appException = _toAppException(error);
    final l10n = AppLocalizations.of(context);
    final message = l10n != null
        ? appException.localizedMessage(l10n)
        : appException.toString();

    return AppErrorUiModel(
      message: message,
      severity: appException.severity,
      originalException: appException,
    );
  }

  /// 📦 核心底层适配引擎：将来自各方的异常形态智能解包/归一化映射为标准的域异常 AppException。
  static AppException _toAppException(Object error) {
    if (error is AppException) return error;

    if (error is DioException) {
      // 🛡️ 支持极个别已包装过的异常传递
      final inner = error.error;
      if (inner is AppException) return inner;

      // 📢 核心中央映射逻辑：将底层的网络库 DioException 智能翻译为纯净、结构化的业务级 AppException
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const AppException.network();

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final data = error.response?.data;
          String? msg;
          if (data is Map) {
            msg = data['message'] as String? ?? data['msg'] as String?;
          }

          if (statusCode == 401) {
            return const AppException.unauthorized();
          } else if (statusCode == 400 || statusCode == 422) {
            return AppException.badRequest(msg);
          } else if (statusCode != null && statusCode >= 500) {
            return AppException.server(msg);
          }
          return AppException.unknown(msg);

        default:
          // 包含 connectionError, cancel 等其他网络底层异常
          return const AppException.network();
      }
    }

    return AppException.unknown(error.toString());
  }

  /// 集中处理/上报异常，并根据解析出的展示策略进行智能分发与 UI 拦截
  static void handle(Object error, [StackTrace? stackTrace]) {
    // 1. 控制台及 APM 服务统一上报 (无论哪种策略，在后台都进行全量日志记录)
    debugPrint('🚨 [Global Error Tracker] Captured Error: $error\n$stackTrace');

    // 2. 界面展示分发（确保在 Microtask 队列中异步执行，规避 build 渲染阶段的弹窗调度冲突）
    Future.microtask(() {
      final context = rootNavigatorKey.currentContext;
      if (context == null || !context.mounted) return;

      // ⚡️ 一键路由至中央解析器进行元数据解析
      final errorUi = resolve(error, context);

      switch (errorUi.severity) {
        case AppErrorSeverity.inline:
          // 🛡️ 页内局部异常：由局部 Widget (如 AsyncValueWidget) 自理渲染，此处静默拦截，防止全局弹窗的双重打扰！
          debugPrint(
            'ℹ️ [Inline Error Ignored] Already handled locally, suppressing global alert.',
          );
          break;

        case AppErrorSeverity.fullscreen:
          // TODO: 真正实现全局错误页后，这里执行路由跳转。目前向下落入 toast，确保不静默失败。
          debugPrint(
            '⚠️ [Fullscreen Error] Redirecting functionality pending implementation.',
          );
          continue toastLabel;

        toastLabel:
        case AppErrorSeverity.toast:
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorUi.message),
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
      debugPrint('📝 [Provider Update Error] $providerName: ${newValue.error}');
    } else {
      debugPrint('🔄 [Provider Updated] $providerName');
    }
  }
}
