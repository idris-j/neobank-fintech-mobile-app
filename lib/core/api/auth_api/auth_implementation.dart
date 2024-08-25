import 'dart:convert';
import 'dart:developer';
import 'package:jeemo_pay/core/api/api_utils/api_routes.dart';
import 'package:jeemo_pay/core/data_models/login_model.dart';
import 'package:jeemo_pay/shared/cache.dart';

import '../../../shared/locator.dart';
import '../../data_models/api_response.dart';
import '../api_utils/api_helper.dart';
import 'auth_api.dart';

class AuthImpl implements AuthApi {
  var server = locator<API>();

  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Map<String, String> get mediaHeader => {
        'Accept': 'application/json',
        // 'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Future<Map<String, String>> headerWithToken() async {
    String token = await localStorage().getString("token") ?? "";

    Map<String, String> headerToken = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
    log("token | $token ");

    return headerToken;
  }

  @override
  Future<LoginModel> loginMerchant(
      {String? phoneNumber, String? password}) async {
    Map val = {"phone": phoneNumber, "password": password};
    var responseBody =
        await server.post(ApiRoutes.login, header, jsonEncode(val));
    LoginModel response = loginModelFromJson(responseBody);
    return response;
  }

  @override
  Future<LoginModel> signupMerchant(
      {String? firstName,
      String? middleName,
      String? lastName,
      String? email,
      String? phoneNumber,
      String? password}) async {
    Map val = {
      "firstName": firstName,
      "otherName": middleName,
      "lastName": lastName,
      "email": email,
      "phone": phoneNumber,
      "password": password
    };
    var responseBody =
        await server.post(ApiRoutes.signup, header, jsonEncode(val));
    LoginModel response = loginModelFromJson(responseBody);
    return response;
  }

  @override
  Future<ApiResponse> sendOtp({String? phoneNumber}) async {
    Map val = {"phone": phoneNumber};
    var responseBody = await server.post(
        ApiRoutes.sendOtp, await headerWithToken(), jsonEncode(val));
    ApiResponse response = apiResponseFromJson(responseBody);
    return response;
  }

  @override
  Future<ApiResponse> validateOtp({String? phoneNumber, String? otp}) async {
    Map val = {"phone": phoneNumber, "OTP": otp};
    var responseBody = await server.post(
        ApiRoutes.validateOtp, await headerWithToken(), jsonEncode(val));
    ApiResponse response = apiResponseFromJson(responseBody);
    return response;
  }
}
