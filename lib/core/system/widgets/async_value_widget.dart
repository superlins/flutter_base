import 'package:base/core/error/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base/l10n/app_localizations.dart';
import '../../error/app_exception.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace? stack)? errorWidget;
  final Widget Function()? loadingWidget;
  final VoidCallback? onRetry;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.errorWidget,
    this.loadingWidget,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return value.when(
      data: data,
      error: (err, stack) {
        if (errorWidget != null) {
          return errorWidget!(err, stack);
        }

        // 🛡️ 调用全局统一解析器，完美映射自定义异常与多语言文案，告别零散判定！
        final errorUi = AppErrorHandler.resolve(err, context);
        final String errorMsg = errorUi.message;

        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  errorMsg,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (onRetry != null) ...[
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh_rounded),
                    label: Text(l10n?.retry ?? ''),
                  ),
                ],
              ],
            ),
          ),
        );
      },
      loading:
          loadingWidget ??
          () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
