import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base/l10n/app_localizations.dart';

part 'app_exception.freezed.dart';

enum AppErrorSeverity {
  /// 全屏覆盖/阻断性错误（例如：认证失效、服务器崩溃）
  fullscreen,

  /// 轻量化提示/非阻断性错误（例如：表单提交失败），使用 SnackBar/Toast 展示
  toast,

  /// 局部页内展示（例如：数据列表加载失败），由 AsyncValueWidget 等局部 UI 渲染，不触发全局弹窗
  inline,
}

@freezed
abstract class AppException with _$AppException implements Exception {
  const factory AppException.network([
    String? message,
    @Default(AppErrorSeverity.inline) AppErrorSeverity severity,
  ]) = _NetworkException;

  const factory AppException.unauthorized([
    String? message,
    @Default(AppErrorSeverity.fullscreen) AppErrorSeverity severity,
  ]) = _UnauthorizedException;

  const factory AppException.badRequest([
    String? message,
    @Default(AppErrorSeverity.inline) AppErrorSeverity severity,
  ]) = _BadRequestException;

  const factory AppException.server([
    String? message,
    @Default(AppErrorSeverity.toast) AppErrorSeverity severity,
  ]) = _ServerException;

  const factory AppException.moderation(
    String reason,
    List<String> riskWords, [
    @Default(AppErrorSeverity.toast) AppErrorSeverity severity,
  ]) = _ModerationException;

  const factory AppException.unknown([
    String? message,
    @Default(AppErrorSeverity.inline) AppErrorSeverity severity,
  ]) = _UnknownException;

  const AppException._();

  String localizedMessage(AppLocalizations l10n) => when(
    network: (msg, _) => msg ?? l10n.error_network,
    unauthorized: (msg, _) => msg ?? l10n.error_unauthorized,
    badRequest: (msg, _) => msg ?? l10n.error_bad_request,
    server: (msg, _) => msg ?? l10n.error_server,
    moderation: (reason, _, __) => l10n.error_moderation(
      reason.isEmpty ? l10n.moderation_default_reason : reason,
    ),
    unknown: (msg, _) => msg ?? l10n.error_unknown,
  );

  @override
  String toString() => 'AppException';
}
