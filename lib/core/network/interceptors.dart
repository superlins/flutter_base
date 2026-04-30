import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// 日志拦截器（仅 debug 模式启用）
Interceptor loggingInterceptor() => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    );

/// 认证拦截器：自动注入 Token
Interceptor authInterceptor() => InterceptorsWrapper(
      onRequest: (options, handler) {
        // 从本地存储或状态管理中获取 Token
        // final token = await getToken();
        // if (token != null) {
        //   options.headers['Authorization'] = 'Bearer $token';
        // }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          debugPrint('Unauthorized: token may be expired');
        }
        return handler.next(e);
      },
    );

/// 重试拦截器：对网络超时和 5xx 错误自动重试
Interceptor retryInterceptor({int maxRetries = 2}) => InterceptorsWrapper(
      onError: (DioException e, handler) async {
        final extra = e.requestOptions.extra;
        final retries = extra['retries'] as int? ?? 0;

        if (retries < maxRetries && _shouldRetry(e)) {
          extra['retries'] = retries + 1;

          final delay = Duration(milliseconds: 500 * (retries + 1));
          debugPrint('Retrying request in ${delay.inMilliseconds}ms '
              '(${retries + 1}/$maxRetries): ${e.requestOptions.path}');

          await Future.delayed(delay);

          try {
            final response = await e.requestOptions.adapter(e.requestOptions);
            return handler.resolve(response);
          } catch (_) {
            // 重试失败，继续抛出原始错误
          }
        }

        return handler.next(e);
      },
    );

bool _shouldRetry(DioException e) {
  return e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError ||
      (e.response?.statusCode != null &&
          (e.response!.statusCode! >= 500 || e.response!.statusCode! == 429));
}
