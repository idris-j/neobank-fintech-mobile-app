class ApiResponse {
  final bool success;
  final String message;
  final Map<String, dynamic> data;

  ApiResponse(
      {required this.success, required this.message, this.data = const {}});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] ?? {},
    );
  }
}
