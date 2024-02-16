import 'package:auth_user/auth_user.dart';
import 'package:daily_expense_tracker_app/features/home/logic/main_bloc/main_cubit.dart';
import '../features/home/data/main_repository/main_base_repository.dart';
import '../features/home/data/main_repository/main_repository.dart';
import '../features/transaction/data/repository/transaction_base_repository.dart';
import '../features/transaction/data/repository/transaction_repository.dart';
import '../features/transaction/logic/transaction_cubit/transaction_cubit.dart';
import 'service/network_info.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'models/transaction_hive_model.dart';

final getIt = GetIt.I;

Future<void> initAppConfig() async {
  // Initialize [FirebaseApp].
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  //dbFirestoreClient
  final dbFirestoreClient = DbFirestoreClient();
  getIt.registerLazySingleton<DbFirestoreClientBase>(() => dbFirestoreClient);

  final authUser = AuthUser();
  getIt.registerLazySingleton<AuthUserBase>(() => authUser);

  //dbHiveClient
  final dbHiveClient = DbHiveClient();
  getIt.registerLazySingleton<DbHiveClientBase>(() => dbHiveClient);

  //InternetConnectionChecker
  final internetConnectionChecker = InternetConnectionChecker();
  getIt.registerLazySingleton(() => internetConnectionChecker);

  //networkInfo
  final networkInfo = NetworkInfo(getIt());
  getIt.registerLazySingleton<NetworkInfoBase>(() => networkInfo);

  // MainBaseRepository (MainRepository)
  final MainBaseRepository homeBaseRepository = MainRepository(
    dbFirestoreClient: getIt(),
    dbHiveClient: getIt(),
    authUser: getIt(),
  );
  //MainBloc && MainRepository
  getIt.registerLazySingleton(() => homeBaseRepository);
  getIt.registerFactory(() => MainCubit(mainRepository: getIt()));

  // TransactionBaseRepository (TransactionRepository)
  final TransactionBaseRepository transactionRepository = TransactionRepository(
    dbFirestoreClient: getIt(),
    dbHiveClient: getIt(),
    authUser: getIt(),
  );

  //TransactionBloc && TransactionRepository
  getIt.registerLazySingleton(() => transactionRepository);
  getIt.registerFactory(() => TransactionCubit(transactionRepository: getIt()));

  //Hive
  await getIt<DbHiveClientBase>().initDb<TransactionHive>(
    dbName: 'transactions',
    onRegisterAdapter: () {
      Hive.registerAdapter(TransactionHiveAdapter());
      Hive.registerAdapter(TransactionCategoryHiveAdapter());
    },
  );
}
