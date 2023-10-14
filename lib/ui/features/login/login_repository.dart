import 'dart:developer';

import 'package:payprice/core/data_models/login_model.dart';
import 'package:payprice/shared/cache.dart';
import 'package:payprice/shared/shared_utils.dart';
import 'package:payprice/shared/validator.dart';
import 'package:payprice/shared/view_state.dart';
import 'package:flutter/material.dart';

import '../../../core/api/api_utils/network_exception.dart';
import '../../../core/api/auth_api/auth_api.dart';
import '../../../shared/base_view_model.dart';
import '../../../shared/locator.dart';

class LoginProvider extends BaseNotifier with Validators {
  var authApi = locator<AuthApi>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  bool loginComplete = false;
  bool disableTextField = false;

  LoginModel loginModel = LoginModel();

  toggleDisableTextField() {
    disableTextField = !disableTextField;
    notifyListeners();
  }

  checkLoginForm() {
    // log("account | $loginAccountNumber password | $loginPassword");
    if (phoneNumber.text.isNotEmpty && userPassword.text.isNotEmpty) {
      loginComplete = true;
      notifyListeners();
    } else {
      loginComplete = false;
      notifyListeners();
    }
  }

  Future<bool> merchantLogin() async {
    setState(ViewState.Busy);
    toggleDisableTextField();
    print(userPassword.text);
    try {
      loginModel = await authApi.loginMerchant(
          phoneNumber: phoneNumber.text, password: userPassword.text);
      localStorage().saveString("token", loginModel.data!.token!);
      setState(ViewState.Idle);
      toggleDisableTextField();
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
    toggleDisableTextField();
    return false;
  }

  disposeController() {
    phoneNumber.text = "";
    userPassword.text = "";
    loginComplete = false;
    disableTextField = false;
    notifyListeners();
  }
}
