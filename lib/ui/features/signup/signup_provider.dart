import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jeemo_pay/core/api/api_utils/network_exception.dart';
import 'package:jeemo_pay/core/api/auth_api/auth_api.dart';
import 'package:jeemo_pay/core/data_models/login_model.dart';
import 'package:jeemo_pay/shared/base_view_model.dart';
import 'package:jeemo_pay/shared/cache.dart';
import 'package:jeemo_pay/shared/locator.dart';
import 'package:jeemo_pay/shared/shared_utils.dart';
import 'package:jeemo_pay/shared/validator.dart';
import 'package:jeemo_pay/shared/view_state.dart';

class SignUpProvider extends BaseNotifier with Validators {
  var authApi = locator<AuthApi>();

  // Controllers for sign-up details
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(); // For CreatePasswordScreen
  TextEditingController confirmPasswordController =
      TextEditingController(); // For Confirm Password Screen

  bool signupCompleted = false;
  bool passwordCompleted = false; // Track if password setup is complete
  bool disableTextField = false;

  LoginModel loginModel = LoginModel(email: '', password: '');

  // Getters for other fields
  bool get otpCompleted => false;

  // Toggle disable state for text fields
  toggleDisableTextField() {
    disableTextField = !disableTextField;
    notifyListeners();
  }

  // Check if sign-up details are complete
  checkSignUp() {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty) {
      signupCompleted = true;
    } else {
      signupCompleted = false;
    }
    notifyListeners();
  }

  // Check if password is valid
  void checkPassword() {
    passwordCompleted = passwordController.text.length >= 8;
    notifyListeners(); // Notify listeners to update UI
  }

  // Validate confirm password
  String? validateConfirmPassword(String confirmPassword, String password) {
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Register user
  Future<bool> register() async {
    setState(ViewState.Busy);
    toggleDisableTextField();

    try {
      final response = await authApi.register(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phoneNumber: phoneNumber.text,
        password: passwordController.text,
      );
      localStorage().saveString("token", response['data']['token']);
      setState(ViewState.Idle);
      toggleDisableTextField();
      return true;
    } on NetworkException {
      displayInfo(
          error: 'No Internet!',
          message: 'Please check your internet connection');
    } catch (e) {
      displayInfo(error: "Error!", message: "$e");
      log("$e");
    }
    setState(ViewState.Idle);
    toggleDisableTextField();
    return false;
  }

  // OTP-related methods
  TextEditingController otp = TextEditingController();

  void disposeOTP() {
    otp.dispose();
  }

  checkOTP() {}
  validateOTP() {}

  sendOtp() {}

  // Dispose controllers used for sign-up details
  void disposeSignup() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    signupCompleted = false;
    disableTextField = false;
    notifyListeners();
  }

  // Dispose password controller
  void disposePassword() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordCompleted = false;
    notifyListeners();
  }

  checkPin() {}
}
