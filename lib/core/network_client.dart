import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 提供 Dio 实例的 Provider
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com', // 替换为你的实际 API 地址
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // 添加日志拦截器（仅在调试模式下推荐，或者通过开关控制）
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));

  // 添加自定义拦截器（例如：自动注入 Token）
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // 在这里从本地存储或状态管理中获取 Token
      // const token = 'YOUR_TOKEN';
      // options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    },
    onError: (DioException e, handler) {
      // 可以在这里统一处理 401 (未授权) 等错误，例如自动跳转登录页
      if (e.response?.statusCode == 401) {
        // 处理退出登录逻辑
      }
      return handler.next(e);
    },
  ));

  return dio;
});
