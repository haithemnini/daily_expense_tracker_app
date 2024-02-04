import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Inter',
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    outline: AppColors.outline,
    background: AppColors.backgroundlight,
    onBackground: AppColors.onBackgroundlight,
  ),
);

ThemeData appThemeDark = ThemeData(
  fontFamily: 'Inter',
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    outline: AppColors.outline,
    background: AppColors.backgroundDark,
    onBackground: AppColors.onBackgroundDark,
  ),
);
