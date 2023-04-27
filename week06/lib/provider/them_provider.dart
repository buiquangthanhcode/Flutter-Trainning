import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void changeTheme(bool dark) {
    themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
