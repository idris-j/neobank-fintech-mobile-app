import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../api_utils/response_handler.dart';

class AuthApi {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await ApiHelper.post(ApiRoutes.login, {
      'email': email,
      'password': password,
    });
    return ResponseHandler.handleResponse(response.body);
  }

  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await ApiHelper.post(ApiRoutes.register, {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
    });
    return ResponseHandler.handleResponse(response.body);
  }
}
