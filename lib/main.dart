import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/daily_tracker_app.dart';
import 'bloc_observer.dart';
import 'core/app_injections.dart';
import 'core/router/app_route.dart';

// final DbFirestoreClientBase dbFirestoreClient = DbFirestoreClient();
// final DbHiveClientBase dbHiveClient = DbHiveClient();

// final NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker());

// final HomeBaseRepository homeBaseRepository = HomeRepository(
//   dbClient: dbFirestoreClient,
//   dbHiveClient: dbHiveClient,
//   networkInfo: networkInfo,
// );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([initAppConfig()]);
  Bloc.observer = AppBlocObserver();

  runApp(
    DailyTrackerApp(
      appRoute: AppRouter(),
    ),
  );
}
