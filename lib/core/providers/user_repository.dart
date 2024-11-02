import '../api/auth_api/auth_implementation.dart';
import '../data_models/login_model.dart';
import '../data_models/user_profile_model.dart';

class UserRepository {
  final AuthImplementation _authImplementation = AuthImplementation();

  Future<UserProfileModel> login(LoginModel loginModel) async {
    final response =
        await _authImplementation.login(loginModel.email, loginModel.password);
    return UserProfileModel.fromJson(response['data']);
  }

  Future<UserProfileModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await _authImplementation.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
    return UserProfileModel.fromJson(response['data']);
  }
}
