
import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme
}

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
      appBarTheme: const AppBarTheme(
        color:  Colors.red,
      ),
  ),

  AppTheme.darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red.shade900,
    canvasColor: Colors.black87,
    appBarTheme: AppBarTheme(
      color:  Colors.red.shade900,
    ),
  ),
};
