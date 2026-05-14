import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import 'interceptors.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // 日志拦截器
  dio.interceptors.add(loggingInterceptor());

  // 认证拦截器
  dio.interceptors.add(authInterceptor(ref));

  // 重试拦截器
  dio.interceptors.add(retryInterceptor());

  return dio;
});
