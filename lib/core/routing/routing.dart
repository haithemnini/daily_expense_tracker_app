import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_view.dart';
import '../../features/settings/settings_view.dart';
import '../../features/transaction/transaction_view.dart';
import '../enums/enums.dart';

@immutable
class RoutesName {
  const RoutesName._();
  static const String home = '/';
  static const String transaction = '/transaction';
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

      case RoutesName.transaction:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: TransactionView(
            transaction: arguments as TransactionType,
          ),
        );

      case RoutesName.settings:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const SettingsView(),
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
