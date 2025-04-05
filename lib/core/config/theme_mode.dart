import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeOfApp {
  static const _key = 'isDarkMode';

  static Future<ThemeMode> get theme async =>
      await isThemeDark() ? ThemeMode.dark : ThemeMode.light;

  static Future<bool> isThemeDark() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> _saveThemeToBox(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode);
  }

  static Future<ThemeMode> switchTheme() async {
    bool currentTheme = await isThemeDark();
    bool newTheme = !currentTheme;
    await _saveThemeToBox(newTheme);

    if (newTheme) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
