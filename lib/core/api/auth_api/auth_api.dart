import 'package:jeemo_pay/core/data_models/login_model.dart';

import '../../data_models/api_response.dart';

abstract class AuthApi {
  Future<LoginModel> loginMerchant({String phoneNumber, String password});
  Future<LoginModel> signupMerchant(
      {String firstName,
      String middleName,
      String lastName,
      String email,
      String phoneNumber,
      String password});
  Future<ApiResponse> sendOtp({String phoneNumber});
  Future<ApiResponse> validateOtp({String phoneNumber, String otp});
}
