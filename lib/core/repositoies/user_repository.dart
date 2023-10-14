import 'dart:async';
import 'dart:developer';

import 'package:payprice/core/data_models/user_profile_model.dart';
import 'package:payprice/shared/base_view_model.dart';
import 'package:payprice/shared/shared_utils.dart';
import 'package:payprice/shared/view_state.dart';

import '../../shared/locator.dart';
import '../../shared/validator.dart';
import '../api/user_api/user_api.dart';
import '../api/api_utils/network_exception.dart';

class UserProvider extends BaseNotifier with Validators {
  // variables
  var userApi = locator<UserApi>();
  String currentOnboardingImage = "assets/images/onboarding1.png";
  int selectedIndex = 0;

  UserProfileModel userProfileModel = UserProfileModel();

  updateSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<bool> fetchUserProfile() async {
    setState(ViewState.Busy);

    try {
      userProfileModel = await userApi.fetchUserProfile();
      setState(ViewState.Idle);

      return true;
    } on NetworkException {
      displayInfo(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayInfo(error: "Error!", message: "$e");
      log("$e");
    }
    setState(ViewState.Idle);

    return false;
  }
}
