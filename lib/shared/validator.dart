import 'package:intl/intl.dart';

/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
mixin Validators {
  String _password = "";
  String _pin = "";

  final phoneNumberRegExp = RegExp(r'^(?:(?:\+|00)234)?(0[789][01]\d{8})$');
  final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email field cannot be empty';
    }
    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Invalid email';
    }
    return null;
  }

  String? validateRetailEmail(String value) {
    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Invalid email';
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Address field cannot be empty';
    }
    return null;
  }

  String? validateAmount(String value) {
    if (value.isEmpty) {
      return 'Field cannot be empty';
    }
    if (value.length > 10) {
      return 'Amount too large';
    }
    return null;
  }

  String? validateName(String value) {
    if (value.length < 2) {
      return 'Entry is too short';
    }
    if (value.isEmpty) {
      return 'Name field cannot be empty';
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.length < 11) {
      return 'Invalid phone number';
    }
    if (!phoneNumberRegExp.hasMatch(value.trim())) {
      return 'Invalid phone number';
    }
    return null;
  }

  String? validateAccountNumber(String value) {
    if (value.isEmpty) return "Field cannot be empty";

    if (value.length < 10) {
      return 'Invalid account number';
    }

    return null;
  }

  String? validateComment(String value) {
    if (value.isEmpty) return "Field cannot be empty";

    return null;
  }

  String? validateReferral(String value) {
    if (value.length > 6) return "Invalid entry";
    return null;
  }

  String? validateZip(String value) {
    if (!zipCodeRegExp.hasMatch(value.trim())) {
      return 'Invalid zip code';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Password field cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    }
    _password = value;
    return null;
  }

  String? confirmPassword(String confirmPassword) {
    if (confirmPassword != _password) {
      return 'Passwords do not match';
    } else if (confirmPassword.isEmpty) {
      return 'Confirm password field cannot be empty';
    }
    return null;
  }

  String? validateConfirmPassword(String confirmPassword, String password) {
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? confirmPin(String confirmPin) {
    if (confirmPin != _pin) {
      return 'PINs do not match';
    } else if (confirmPin.isEmpty) {
      return 'Confirm PIN field cannot be empty';
    }
    return null;
  }

  String? validatePin(String value) {
    if (value.trim().isEmpty) {
      return 'PIN field cannot be empty';
    } else if (value.length != 4) {
      return 'PIN must be 4 numbers';
    }
    _pin = value;
    return null;
  }

  String? validatePin1(String value) {
    if (value.trim().isEmpty) {
      return 'PIN field cannot be empty';
    } else if (value.length != 4) {
      return 'PIN must be 4 numbers';
    }
    return null;
  }

  bool isValidDate(String input) {
    String editInput = input.replaceAll(RegExp('/'), '');
    try {
      final date = DateFormat("dd/MM/yyyy").parse(input);
      final originalFormatString = toOriginalFormatString(date);
      return editInput == originalFormatString;
    } catch (e) {
      return false;
    }
  }

  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$d$m$y";
  }

  String? validateCard(String input) {
    if (input.isEmpty) {
      return "Please enter a credit card number";
    }

    if (input.length < 8) {
      return "Not a valid credit card number";
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      int digit = int.parse(input[length - i - 1]);

      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return "You entered an invalid credit card number";
  }
}
