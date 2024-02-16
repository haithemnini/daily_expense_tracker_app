import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../config/overlay_style_config.dart';

class Helper {
  /// Sets the system UI overlay style for navigation elements.
  ///
  /// This method applies the [SystemUiOverlayStyle] configuration for navigation elements
  /// to the current [BuildContext].
  static void overlayNavigation(BuildContext context) {
    OverlayStyleConfig.overlayNavigation(context);
  }

  /// Retrieves the system UI overlay style for app bars.
  ///
  /// This method returns the [SystemUiOverlayStyle] configuration for app bars
  /// based on the current [BuildContext].
  ///
  /// Returns:
  ///   The [SystemUiOverlayStyle] configuration for app bars.
  static overlayStyleAppBar(BuildContext context) {
    return OverlayStyleConfig.overlayAppBar(context);
  }

  /// Determines if the current theme mode in the given [context] is dark mode.
  /// Returns `true` if the theme mode is dark, `false` otherwise.
  /// If no [context] is provided, the current [BuildContext] is used.
  /// If no [context] is available, `false` is returned.
  /// This method is a shortcut for `Theme.of(context).brightness == Brightness.dark`.
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  //get asset image path from assets folder
  static String getAssetImage(String name) {
    return 'assets/images/$name';
  }

  //get asset svg path from assets folder
  static String getAssetSvg(String name) {
    return 'assets/svgs/$name';
  }

  static String generateUUID() {
    return const Uuid().v4();
  }
}
