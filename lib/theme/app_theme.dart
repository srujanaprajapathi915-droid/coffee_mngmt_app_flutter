import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xFF1E1E28); // Dark purple-grey
  static const Color accentColor = Color(0xFFD17842); // Copper/Orange
  static const Color cardColor = Color(0xFF262A33);
  static const Color textColor = Colors.white;
  static const Color subtitleColor = Colors.grey;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: accentColor,
      colorScheme: const ColorScheme.dark(
        primary: accentColor,
        surface: backgroundColor,
        onSurface: textColor,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: textColor),
        bodySmall: TextStyle(color: subtitleColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: accentColor,
        unselectedItemColor: subtitleColor,
      ),
      useMaterial3: true,
    );
  }
}
