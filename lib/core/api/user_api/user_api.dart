import 'package:payprice/core/data_models/generae_link_model.dart';
import 'package:payprice/core/data_models/user_profile_model.dart';

import '../../data_models/api_response.dart';

abstract class UserApi {
  // Future<ApiResponse> login({String phoneNumber, String password});
  Future<UserProfileModel> fetchUserProfile();
  Future<GenerateLinkModel> generateLink({String amount, String email});


}
