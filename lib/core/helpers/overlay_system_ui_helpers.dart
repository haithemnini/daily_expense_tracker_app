import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/extensions.dart';

/// A helper class for managing the system UI overlay settings in the app.
class OverlaySystemUiConfig {
  const OverlaySystemUiConfig._();

  /// Returns the [SystemUiOverlayStyle] for the app's app bar.
  ///
  /// The [statusBarColor] is set to transparent.
  /// The [statusBarIconBrightness] is determined based on the app's theme.
  /// The [systemNavigationBarIconBrightness] is set to [Brightness.dark].
  /// The [systemNavigationBarColor] is set to transparent.
  /// The [systemNavigationBarDividerColor] is set to transparent.
  /// The [systemNavigationBarContrastEnforced] is set to false.
  /// The [systemStatusBarContrastEnforced] is set to false.
  static SystemUiOverlayStyle systemUiOverlayAppBar(BuildContext context) =>
      const SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            context.isDarkTheme() ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemStatusBarContrastEnforced: false,
      );

  /// Sets the system UI overlay settings for the app.
  ///
  /// The [statusBarColor] is set to transparent.
  /// The [statusBarIconBrightness] is determined based on the app's theme.
  /// The [systemNavigationBarIconBrightness] is set to [Brightness.dark].
  /// The [systemNavigationBarColor] is set to transparent.
  /// The [systemNavigationBarDividerColor] is set to transparent.
  /// The [systemNavigationBarContrastEnforced] is set to false.
  /// The [systemStatusBarContrastEnforced] is set to false.
  ///
  /// The system UI overlay style is applied using [SystemChrome.setSystemUIOverlayStyle].
  /// The system UI mode is set to [SystemUiMode.manual] with [SystemUiOverlay.top] and [SystemUiOverlay.bottom] overlays enabled.
  /// The system UI mode is also set to [SystemUiMode.edgeToEdge] with [SystemUiOverlay.bottom] overlay enabled.
  /// Finally, the system UI mode is set to [SystemUiMode.edgeToEdge] without any specific overlays enabled.
  static overlaySystemUi(BuildContext context) {
    Brightness statusBarIconBrightness =
        context.isDarkTheme() ? Brightness.dark : Brightness.dark;

    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle().copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: statusBarIconBrightness,
      systemNavigationBarIconBrightness: statusBarIconBrightness,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    );

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom],
    );

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
  }
}
