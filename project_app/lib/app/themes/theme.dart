import 'package:flutter/material.dart';
import 'package:project_app/app/themes/config.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme().copyWith(
        bodyText1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red)),
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(bodyText1: TextStyle(color: AppColor.blue)));
}
