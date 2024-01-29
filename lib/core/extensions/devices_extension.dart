import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/overlay_system_ui_helpers.dart';

/// Extension on [BuildContext] build context to provide easy access Context Extension.
extension DevicesContextExtension on BuildContext {
  // Returns the current [ThemeData] of the [BuildContext].
  ThemeData get _theme => Theme.of(this);

  // Sets the system UI overlay based on the current [BuildContext].
  void systemUiOverlayStyleConfig() =>
      SystemUiOverlayStyleConfig.systemUiOverlay(this);

  SystemUiOverlayStyle systemUiOverlayStyleAppBar() {
    return SystemUiOverlayStyleConfig.systemUiOverlayAppBar(this);
  }

  // Calculates the screen height based on the current [BuildContext] and a given value.
  double screenHeight(double value) => ScreenUtil().screenHeight * value;

  // Calculates the screen width based on the current [BuildContext] and a given value.
  double screenWidth(double value) => ScreenUtil().screenWidth * value;

  // Returns the [TextTheme] of the current [BuildContext]'s theme.
  TextTheme get textTheme => _theme.textTheme;

  // Returns the [ColorScheme] of the current [BuildContext]'s theme.
  ColorScheme get colorScheme => _theme.colorScheme;

  // Returns the size of the current [BuildContext]'s device.
  Size get deviceSize => MediaQuery.sizeOf(this);

  // Returns the width of the current [BuildContext]'s device.
  double get deviceWidth => deviceSize.width;

  // Returns the height of the current [BuildContext]'s device.
  bool isDarkTheme() => _theme.brightness == Brightness.dark;
}
