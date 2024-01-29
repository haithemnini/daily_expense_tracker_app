import 'package:flutter/material.dart';

/// Extension on [BuildContext] build context to provide easy access Context Extension.
extension RoutesContextExtension on BuildContext {
  /// Pops the current screen from the navigation stack.
  void pop() => Navigator.pop(this);

  // Pushes a named route onto the navigation stack.
  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  // Replaces the current screen with a named route on the navigation stack.
  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  // Pushes a named route onto the navigation stack and removes all previous routes.
  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
        this, routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
