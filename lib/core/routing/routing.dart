import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_view.dart';

@immutable
class RoutesName {
  const RoutesName._();
  static const String home = '/';
  static const String addExpense = '/add-expense';
  static const String settings = '/settings';
}

@immutable
class AppRouter {
  PageRoute generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case RoutesName.home:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const HomeView(),
        );

      case RoutesName.addExpense:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const Scaffold(
            body: Center(
              child: Text('Add Expense'),
            ),
          ),
        );

      case RoutesName.settings:
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
