import 'package:dio/dio.dart';
import '../error/app_exception.dart';
import 'api_response.dart';

abstract class BaseRepository {
  /// 网络请求包裹，自动捕获一切 DioException 异常并安全转换为 AppException
  Future<T> safeCall<T>(Future<Response<dynamic>> Function() call, {
    required T Function(dynamic data) parse,
  }) async {
    try {
      final response = await call();
      final data = response.data;
      
      if (data is Map<String, dynamic>) {
        final apiResp = ApiResponse.fromJson(data, (json) => json);
        if (!apiResp.isSuccess) {
          throw AppException.badRequest(apiResp.message);
        }
        return parse(apiResp.data);
      }
      
      return parse(data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is AppException) rethrow;
      throw AppException.unknown(e.toString());
    }
  }

  AppException _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppException.network();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return const AppException.unauthorized();
        } else if (statusCode == 400 || statusCode == 422) {
          final msg = e.response?.data?['message'] as String?;
          return AppException.badRequest(msg);
        } else if (statusCode != null && statusCode >= 500) {
          return const AppException.server();
        }
        return const AppException.unknown();
      default:
        return const AppException.network();
    }
  }
}
