// user_api.dart

import 'package:jeemo_pay/core/data_models/generate_link_model.dart';
import 'package:jeemo_pay/core/data_models/user_profile_model.dart';

abstract class UserApi {
  Future<Map<String, dynamic>> fetchUserProfile(String userId);
  Future<Map<String, dynamic>> updateUserProfile(Map<String, dynamic> userData);
  Future<GenerateLinkModel> generateLink({
    required String amount,
    required String email,
  });

  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> register(String email, String password);
}
