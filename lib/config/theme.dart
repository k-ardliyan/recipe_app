import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
  );
}