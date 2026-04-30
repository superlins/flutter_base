import 'package:dio/dio.dart';

/// 错误级别
enum ErrorLevel { info, warning, error }

/// 通用应用错误，统一处理网络、业务、未知异常
class AppError implements Exception {
  final ErrorLevel level;
  final String message;
  final int? statusCode;
  final Exception? originalException;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AppError({
    this.level = ErrorLevel.error,
    required this.message,
    this.statusCode,
    this.originalException,
    this.actionLabel,
    this.onAction,
  });

  factory AppError.info(String message) => AppError(
        level: ErrorLevel.info,
        message: message,
      );

  factory AppError.warning(String message) => AppError(
        level: ErrorLevel.warning,
        message: message,
      );

  factory AppError.error(String message, {String? actionLabel, VoidCallback? onAction}) => AppError(
        level: ErrorLevel.error,
        message: message,
        actionLabel: actionLabel,
        onAction: onAction,
      );

  factory AppError.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppError.error('请求超时，请检查网络连接', originalException: e);
      case DioExceptionType.badResponse:
        return AppError.fromStatusCode(e.response?.statusCode, originalException: e);
      case DioExceptionType.cancel:
        return AppError.warning('请求已取消', originalException: e);
      case DioExceptionType.connectionError:
        return AppError.error('网络连接异常，请检查网络设置', originalException: e);
      default:
        return AppError.error('未知错误', originalException: e);
    }
  }

  factory AppError.fromStatusCode(int? code, {Exception? originalException}) {
    switch (code) {
      case 400:
        return AppError.error('请求参数错误', statusCode: code, originalException: originalException);
      case 401:
        return AppError.error('未授权，请重新登录',
            statusCode: code,
            actionLabel: '去登录',
            onAction: () {/* 跳转登录 */},
            originalException: originalException);
      case 403:
        return AppError.error('拒绝访问', statusCode: code, originalException: originalException);
      case 404:
        return AppError.warning('请求的资源不存在', statusCode: code, originalException: originalException);
      case 422:
        return AppError.error('请求数据格式错误', statusCode: code, originalException: originalException);
      case 500:
        return AppError.error('服务器内部错误', statusCode: code, originalException: originalException);
      default:
        return AppError.error('请求失败 (${code ?? '未知'})', statusCode: code, originalException: originalException);
    }
  }

  bool get isError => level == ErrorLevel.error;
  bool get isWarning => level == ErrorLevel.warning;
  bool get isInfo => level == ErrorLevel.info;
  bool get isUnauthorized => statusCode == 401;
  bool get isServerError => statusCode != null && statusCode! >= 500;

  /// 展示给用户看的文案
  String get displayMessage => message;

  @override
  String toString() => 'AppError($level): $message (statusCode: $statusCode)';
}
