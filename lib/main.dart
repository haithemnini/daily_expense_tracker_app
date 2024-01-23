import 'package:daily_expense_tracker_app/core/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app/daily_tracker_app.dart';
import './core/di/get_it.dart';
import './bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([initConfig()]);
  Bloc.observer = AppBlocObserver();

  runApp(
    DailyTrackerApp(
      appRoute: AppRouter(),
    ),
  );
}
