import 'dart:convert';
import 'dart:developer';

import 'package:payprice/core/api/api_utils/api_routes.dart';
import 'package:payprice/core/data_models/generae_link_model.dart';
import 'package:payprice/core/data_models/user_profile_model.dart';
import 'package:payprice/shared/cache.dart';
import 'package:payprice/shared/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_api.dart';
import '../api_utils/api_helper.dart';
import '../../data_models/api_response.dart';

class UserApiImpl implements UserApi {
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
  Future<UserProfileModel> fetchUserProfile() async {
    var responseBody = await server.get(
        ApiRoutes.fetchMerchantProfile, await headerWithToken());
    UserProfileModel response = userProfileModelFromJson(responseBody);
    return response;
  }

  @override
  Future<GenerateLinkModel> generateLink(
      {String? amount, String? email}) async {
    Map val = {"amount": amount, "email": email};

    var responseBody = await server.post(
        ApiRoutes.generatePaymentLink, await headerWithToken(), jsonEncode(val));
    GenerateLinkModel response = generateLinkModelFromJson(responseBody);
    return response;
  }
}
