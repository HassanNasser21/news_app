import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier{
    ThemeMode themeMode = ThemeMode.dark;
  bool get isLight => themeMode == ThemeMode.light;
  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }
}