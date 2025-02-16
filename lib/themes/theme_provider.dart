import 'package:bein_mobile/themes/app_themes.dart';
import 'package:bein_mobile/themes/theme_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final ThemePreferences _preferences = ThemePreferences();
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  ThemeData get themeData => _isDarkMode ? darkTheme : lightTheme;

  ThemeProvider() {
    _loadTheme();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _preferences.saveTheme(isDarkMode);
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    _isDarkMode = await _preferences.getTheme();
    notifyListeners();
  }
}
