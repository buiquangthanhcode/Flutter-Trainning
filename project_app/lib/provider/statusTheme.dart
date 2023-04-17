import 'package:flutter/material.dart';

class statusTheme extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.light;

  ThemeMode get theme => _theme;

  void setThem(ThemeMode target) {
    _theme = target;
    notifyListeners();
  }
}
