import 'package:jeemo_pay/core/api/user_api/user_api.dart';
import 'package:jeemo_pay/core/api/api_utils/api_helper.dart';
import 'package:jeemo_pay/core/data_models/generate_link_model.dart';
import 'package:jeemo_pay/core/data_models/user_profile_model.dart';
import 'dart:convert';

class UserApiImpl implements UserApi {
  @override
  Future<Map<String, dynamic>> fetchUserProfile(String userId) async {
    final response = await ApiHelper.get('/user/$userId');
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }

  @override
  Future<Map<String, dynamic>> updateUserProfile(
      Map<String, dynamic> userData) async {
    final response = await ApiHelper.put('/user/update', body: userData);
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to update user profile');
    }
  }

  @override
  Future<GenerateLinkModel> generateLink({
    required String amount,
    required String email,
  }) async {
    // TODO: Implement generateLink properly
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response =
        await ApiHelper.post('/login', {'email': email, 'password': password});
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await ApiHelper.post(
        '/register', {'email': email, 'password': password});
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to register');
    }
  }
}
