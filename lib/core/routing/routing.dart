// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Routes {
  const Routes._();
  static const String home = '/';
  static const String addExpense = '/add-expense';
  static const String analytics = '/analytics';
  static const String settings = '/settings';
}

@immutable
class AppRouter {
  PageRoute generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const Scaffold(
            body: Center(
              child: Text('Home'),
            ),
          ),
        );

      case Routes.addExpense:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const Scaffold(
            body: Center(
              child: Text('Add Expense'),
            ),
          ),
        );

      case Routes.analytics:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const Scaffold(
            body: Center(
              child: Text('Analytics'),
            ),
          ),
        );

      case Routes.settings:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const Scaffold(
            body: Center(
              child: Text('Settings'),
            ),
          ),
        );

      default:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
    return CupertinoPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => viewToShow!,
    );
  }
}
