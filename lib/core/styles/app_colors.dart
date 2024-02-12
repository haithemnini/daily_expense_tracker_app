import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF00B2E7);
  static const secondary = Color(0xFFE064F7);
  static const tertiary = Color(0xFFFF8D6C);
  static const outline = Colors.grey;

  //
  static const backgroundlight = Color(0xFFF5F5F5);
  static const onBackgroundlight = Color(0xFF000000);

  //
  static const backgroundDark = Color(0xFF212121);
  static const onBackgroundDark = Color(0xFFFFFFFF);

  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary, tertiary],
    transform: GradientRotation(pi / 4),
  );
}
