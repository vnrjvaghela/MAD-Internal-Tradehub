import 'package:flutter/material.dart';

class AppTheme {
  // Indian Tone Colors
  static const Color saffron = Color(0xFFFF9933);
  static const Color green = Color(0xFF138808);
  static const Color navyBlue = Color(0xFF000080);
  static const Color backgroundColor = Color(0xFFF9F6F0); // Warm off-white
  static const Color surfaceColor = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: saffron,
        primary: saffron,
        secondary: green,
        tertiary: navyBlue,
        background: backgroundColor,
        surface: surfaceColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: saffron,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: saffron,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      cardTheme: CardTheme(
        color: surfaceColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
