class ApiResponse<T> {
  final int code;
  final T? data;
  final String message;

  ApiResponse({
    required this.code,
    this.data,
    required this.message,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponse<T>(
      code: json['code'] as int? ?? 0,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'] as String? ?? '',
    );
  }

  bool get isSuccess => code == 200 || code == 0;
}
