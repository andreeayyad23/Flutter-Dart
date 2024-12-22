import 'package:flutter/material.dart';

class AppTheme {
  /// The primary color of the app.
  static const Color primaryColor = Color.fromRGBO(162, 29, 19, 1);

  /// The secondary color of the app.
  static const Color primaryAccent = Color.fromRGBO(120, 14, 14, 1);

  /// The background color of the app.
  static const Color secodaryColor = Color.fromRGBO(45, 45, 45, 1);

  /// The primary text color of the app.
  static const Color secondaryAccent = Color.fromRGBO(35, 35, 35, 1);

  /// The secondary text color of the app.
  static const Color titleColor = Color.fromRGBO(200, 200, 200, 1);

  /// The accent color of the app.
  static const Color textColor = Color.fromRGBO(150, 150, 150, 1);

  /// The error color of the app.
  static const Color successColor = Color.fromRGBO(9, 149, 110, 1);

  /// The success color of the app.
  static const Color highlightColor = Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
    // seed color
    colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryColor),

    // scaffold colors
    scaffoldBackgroundColor: AppTheme.secondaryAccent,

    // app bar theme colors
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.secodaryColor,
      foregroundColor: AppTheme.textColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme().copyWith(
      bodyMedium: TextStyle(
        color: AppTheme.textColor,
        fontSize: 16,
        letterSpacing: 1,
      ),
      headlineMedium: TextStyle(
        color: AppTheme.titleColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        color: AppTheme.titleColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    ),

    // card theme colors
    cardTheme: CardTheme(
      color: AppTheme.secodaryColor.withOpacity(0.5),
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(),
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 16),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppTheme.secodaryColor.withOpacity(0.5),
        border: InputBorder.none,
        labelStyle: TextStyle(color: AppTheme.textColor),
        prefixIconColor: AppTheme.textColor));
