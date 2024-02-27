import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A helper class for managing the system UI overlay settings in the app.
class OverlayStyleConfig {
  const OverlayStyleConfig._();

  /// Sets the system UI overlay style to the default style.
  static SystemUiOverlayStyle overlayAppBar(BuildContext context) {
    return const SystemUiOverlayStyle().copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    );
  }

  /// Sets the system UI overlay style to the default style.
  static overlayNavigation(BuildContext context) {
    Brightness statusBarIconBrightness =
        Theme.of(context).brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light;

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
