import 'package:payprice/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = appThemeLight;
  ThemeData get currentTheme => _currentTheme;
  bool isdark = false;

  ThemeProvider(bool isDark) {
    if (isDark) {
      toggleToDarkTheme();
      isdark = true;
      notifyListeners();
    } else {
      toggleToLightTheme();
      isdark = false;
      notifyListeners();
    }
  }

  void toggleToLightTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_dark", false);
    isdark = false;
    _currentTheme = appThemeLight;
    notifyListeners();
  }

  void toggleToDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_dark", true);
    isdark = true;

    _currentTheme = appThemeDark;
    notifyListeners();
  }
}

final ThemeData appThemeLight = ThemeData(
  primaryColor: const Color(0xFFFABA46),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    background: Colors.white,
  ),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey,
      selectionColor: appPrimaryColor.withOpacity(.5),
      selectionHandleColor: appPrimaryColor),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black),
  ),
  fontFamily: 'Plus_Jakarta_Sans',
);

final ThemeData appThemeDark = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF051F2D),
  primaryColor: const Color(0xFF09414A),
  colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark, background: Color(0xFF27374D)),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey,
      selectionColor: appPrimaryColor.withOpacity(.5),
      selectionHandleColor: appPrimaryColor),

  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
  ),
  fontFamily: 'Plus_Jakarta_Sans', // Font family
);
