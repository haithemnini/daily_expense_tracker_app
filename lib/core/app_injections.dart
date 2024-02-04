import 'package:daily_expense_tracker_app/core/service/network_info.dart';
import 'package:daily_expense_tracker_app/features/home/logic/home_bloc/home_cubit.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../features/home/data/repository/home_repository.dart';
import 'firebase_options.dart';
import 'models/transaction_hive_model.dart';

final getIt = GetIt.I;

Future<void> initAppConfig() async {
  // Initialize [FirebaseApp].
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //dbFirestoreClient
  final dbFirestoreClient = DbFirestoreClient();
  getIt.registerLazySingleton(() => dbFirestoreClient);

  //dbHiveClient
  final dbHiveClient = DbHiveClient();
  getIt.registerLazySingleton(() => dbHiveClient);

  //InternetConnectionChecker
  final internetConnectionChecker = InternetConnectionChecker();
  getIt.registerLazySingleton(() => internetConnectionChecker);

  //networkInfo
  final networkInfo = NetworkInfoImpl(getIt());
  getIt.registerLazySingleton(() => networkInfo);

  //HomeBaseRepository (HomeRepository)
  final homeBaseRepository = HomeRepository(
    dbFirestoreClient: getIt(),
    dbHiveClient: getIt(),
    networkInfo: getIt(),
  );

  getIt.registerLazySingleton(() => homeBaseRepository);

  //HomeBloc
  getIt.registerFactory(() => HomeCubit(homeRepository: getIt()));

  //Hive
  await getIt<DbHiveClient>().initDb(
    dbName: 'transactions',
    adapterList: [TransactionHiveModelAdapter, TransactionTypeHiveAdapter],
  );
}
