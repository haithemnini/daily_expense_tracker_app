import 'package:flutter/material.dart';

abstract class ThemesBaseRepository {
  Future<ThemeMode> getTheme();
  Future<void> setTheme(ThemeMode theme);
}
