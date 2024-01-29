import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/home_view.dart';
import '../../features/profile/profile_view.dart';
import '../../features/transaction/transaction_view.dart';
import '../enum/enum.dart';

@immutable
class RouteName {
  const RouteName._();
  static const String home = '/';
  static const String settings = '/settings';
  static const String profile = '/profile';
  static const String transaction = '/transaction';
}

@immutable
class AppRouter {
  PageRoute generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case RouteName.home:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const HomeView(),
        );
      case RouteName.transaction:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: TransactionView(
            transaction: arguments as TransactionType,
          ),
        );
      case RouteName.settings:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const Scaffold(
            body: Center(
              child: Text('Add Expense'),
            ),
          ),
        );

      case RouteName.profile:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const ProfileView(),
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
