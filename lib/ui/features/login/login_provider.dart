import 'package:flutter/material.dart';
import 'package:jeemo_pay/core/api/auth_api/auth_api.dart'; // Adjust this import according to your project structure
import 'package:jeemo_pay/shared/locator.dart'; // Service locator for dependency injection

class LoginProvider with ChangeNotifier {
  final AuthApi _authApi = locator<AuthApi>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  TextEditingController phoneNumberController = TextEditingController();
  bool disableTextField = false;

  bool get loginComplete => phoneNumberController.text.isNotEmpty;

  get phoneNumber => null;

  get state => null;

  Future<bool> login() async {
    _isLoading = true;
    notifyListeners();

    try {
      final email = phoneNumberController.text; // Adjust as needed
      final password =
          'your_password'; // Obtain this from the relevant TextEditingController or input
      final result = await _authApi.login(email, password);
      // Handle login result, e.g., saving tokens, user info, etc.
      _errorMessage = null;
      return true;
    } catch (e) {
      // Handle errors
      _errorMessage = 'Login failed: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void disposeController() {
    phoneNumberController.dispose();
  }

  String? validatePhoneNumber(String s) {
    // Implement your phone number validation logic here
    return null; // Return an error message if validation fails
  }

  void checkLoginForm() {
    // Implement your form validation logic here
  }

  // Other login-related methods can be added here
}
