import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color backgroundColor = Color(0xFF2B223E);
  static const Color buttonColor = Color(0xFF7A68FF);
  static const Color buttonTextColor = Colors.white;
  static const Color buttonPressedColor = Color(0xFF6F6C87);
  static const Color mcqOptionColor = Color(0xFF35284E);
  static const Color mcqOptionBorderColor = Color(0xFF7C63AB);
  static const Color wrongOptionColor = Color(0xFF4E2828);
  static const Color correctOptionColor = Color(0xFF284E3E);

  // Theme Data
  static ThemeData get themeData {
    return ThemeData(
      fontFamily: 'AnonymousPro',
      scaffoldBackgroundColor: backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: buttonTextColor,
          shadowColor: buttonPressedColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
