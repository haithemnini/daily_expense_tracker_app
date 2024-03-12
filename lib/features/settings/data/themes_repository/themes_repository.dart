import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes_base_repository.dart';

class ThemesRepository implements ThemesBaseRepository {
  final SharedPreferences _sharedPreferences;

  ThemesRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<ThemeMode> getTheme() => _getCachedThemeMode();

  @override
  Future<void> setTheme(ThemeMode theme) => _cacheThemeMode(theme);

  Future<ThemeMode> _getCachedThemeMode() async {
    final int? cachedThemeModeIndex = _sharedPreferences.getInt("Themes_");

    if (cachedThemeModeIndex != null &&
        cachedThemeModeIndex < ThemeMode.values.length) {
      return ThemeMode.values[cachedThemeModeIndex];
    } else {
      return ThemeMode.dark;
    }
  }

  Future<void> _cacheThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.setInt("Themes_", themeMode.index);
  }
}
