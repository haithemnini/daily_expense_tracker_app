import 'package:flutter/material.dart';

class Themeing {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
      onBackground: Colors.black,
      primary: const Color(0xFF00B2E7),
      secondary: const Color(0xFFE064F7),
      tertiary: const Color(0xFFFF8D6C),
      outline: Colors.grey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      onBackground: Colors.white,
      primary: const Color(0xFF00B2E7),
      secondary: const Color(0xFFE064F7),
      tertiary: const Color(0xFFFF8D6C),
      outline: Colors.grey,
    ),
  );
}
