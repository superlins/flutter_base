import 'package:freezed_annotation/freezed_annotation.dart';
import '../../l10n/app_localizations.dart';

part 'app_exception.freezed.dart';

@freezed
abstract class AppException with _$AppException implements Exception {
  const factory AppException.network([String? message]) = _NetworkException;
  const factory AppException.unauthorized([String? message]) = _UnauthorizedException;
  const factory AppException.badRequest([String? message]) = _BadRequestException;
  const factory AppException.server([String? message]) = _ServerException;
  const factory AppException.moderation(String reason, List<String> riskWords) = _ModerationException;
  const factory AppException.unknown([String? message]) = _UnknownException;

  const AppException._();

  String localizedMessage(AppLocalizations l10n) => when(
        network: (msg) => msg ?? l10n.error_network,
        unauthorized: (msg) => msg ?? l10n.error_unauthorized,
        badRequest: (msg) => msg ?? l10n.error_bad_request,
        server: (msg) => msg ?? l10n.error_server,
        moderation: (reason, _) => l10n.error_moderation(reason.isEmpty ? l10n.moderation_default_reason : reason),
        unknown: (msg) => msg ?? l10n.error_unknown,
      );

  @override
  String toString() => 'AppException';
}
