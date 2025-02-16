import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String themeKey = "theme_mode";

  Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, isDarkMode);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeKey) ?? false;
  }
}
