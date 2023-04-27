import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.red),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.yellow),
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.blue),
    ),
  );
}

class AppColor {
  static Color red = Colors.red;
  static Color blue = const Color.fromARGB(255, 143, 205, 255);
}
