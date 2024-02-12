import 'package:daily_expense_tracker_app/features/home/logic/main_bloc/main_cubit.dart';

import '../features/home/data/main_repository/main_base_repository.dart';
import '../features/home/data/main_repository/main_repository.dart';
import 'service/network_info.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'firebase_options.dart';
import 'models/transaction_hive_model.dart';

final getIt = GetIt.I;

Future<void> initAppConfig() async {
  // Initialize [FirebaseApp].
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //dbFirestoreClient
  final dbFirestoreClient = DbFirestoreClient();
  getIt.registerLazySingleton<DbFirestoreClientBase>(() => dbFirestoreClient);

  //dbHiveClient
  final dbHiveClient = DbHiveClient();
  getIt.registerLazySingleton<DbHiveClientBase>(() => dbHiveClient);

  //InternetConnectionChecker
  final internetConnectionChecker = InternetConnectionChecker();
  getIt.registerLazySingleton(() => internetConnectionChecker);

  //networkInfo
  final networkInfo = NetworkInfo(getIt());
  getIt.registerLazySingleton<NetworkInfoBase>(() => networkInfo);

  //MainBaseRepository (MainRepository)
  final MainBaseRepository homeBaseRepository = MainRepository(
    dbFirestoreClient: getIt(),
    dbHiveClient: getIt(),
    networkInfo: getIt(),
  );

  getIt.registerLazySingleton(() => homeBaseRepository);

  //HomeBloc
  getIt.registerFactory(() => MainCubit(mainRepository: getIt()));

  //Hive
  await getIt<DbHiveClientBase>().initDb(
      dbName: 'transactions',
      onRegisterAdapter: () {
        Hive.registerAdapter(TransactionHiveModelAdapter());
        Hive.registerAdapter(TransactionTypeHiveAdapter());
      });
}
