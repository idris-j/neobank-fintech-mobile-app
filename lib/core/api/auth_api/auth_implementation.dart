import 'auth_api.dart';

class AuthImplementation implements AuthApi {
  final AuthApi _authApi = AuthApi();

  Future<Map<String, dynamic>> login(String email, String password) {
    return _authApi.login(email, password);
  }

  @override
  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) {
    return _authApi.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}
