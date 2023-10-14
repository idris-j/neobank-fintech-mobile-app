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

class SignUpProvider extends BaseNotifier with Validators {
  var authApi = locator<AuthApi>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController merchantPassword = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController otp = TextEditingController();

  bool signupCompleted = false;
  bool passwordCompleted = false;
  bool otpCompleted = false;
  bool disableTextField = false;

  LoginModel loginModel = LoginModel();

  toggleDisableTextField() {
    disableTextField = !disableTextField;
    notifyListeners();
  }

  checkOTP() {
    if (otp.text.isNotEmpty) {
      otpCompleted = true;
      notifyListeners();
      return;
    }
    otpCompleted = false;
    notifyListeners();
  }

  checkPassword() {
    if (merchantPassword.text.isNotEmpty && cPassword.text.isNotEmpty) {
      passwordCompleted = true;
      notifyListeners();
      return;
    }
    passwordCompleted = false;
    notifyListeners();
  }

  checkSignUp() {
    // log("account | $loginAccountNumber password | $loginPassword");
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty) {
      signupCompleted = true;
      notifyListeners();
      return;
    }

    signupCompleted = false;
    notifyListeners();
  }

  Future<bool> merchantSignUp() async {
    setState(ViewState.Busy);
    toggleDisableTextField();

    try {
      loginModel = await authApi.signupMerchant(
          firstName: firstName.text,
          lastName: lastName.text,
          middleName: middleName.text,
          email: email.text,
          phoneNumber: phoneNumber.text,
          password: merchantPassword.text);
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

  Future<bool> sendOtp() async {
    setState(ViewState.Busy);
    try {
      await authApi.sendOtp(
        phoneNumber: phoneNumber.text,
      );
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

  Future<bool> validateOTP() async {
    setState(ViewState.Busy);
    try {
      await authApi.validateOtp(phoneNumber: phoneNumber.text, otp: otp.text);
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

  disposeSignup() {
    firstName.text = "";
    lastName.text = "";
    middleName.text = "";
    email.text = "";
    phoneNumber.text = "";
    signupCompleted = false;
    disableTextField = false;
    notifyListeners();
  }

  disposePassword() {
    merchantPassword.text = "";
    cPassword.text = "";
    passwordCompleted = false;
    notifyListeners();
  }

  disposeOTP() {
    otp.text = "";
    otpCompleted = false;
    notifyListeners();
  }
}
