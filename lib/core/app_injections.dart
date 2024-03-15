import 'package:auth_user/auth_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:db_firestore_client/db_firestore_client.dart';
import 'package:db_hive_client/db_hive_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_service/user_service.dart';

import '../features/blocs/auth_bloc/auth_cubit.dart';
import '../features/blocs/main_bloc/main_cubit.dart';
import '../features/blocs/profile_bloc/profile_cubit.dart';
import '../features/blocs/state_bloc/state_cubit.dart';
import '../features/blocs/themes_bloc/themes_cubit.dart';
import '../features/blocs/transaction_bloc/transaction_cubit.dart';
import '../features/home/data/main_repository/main_base_repository.dart';
import '../features/home/data/main_repository/main_repository.dart';
import '../features/home/data/state_repository/state_base_repository.dart';
import '../features/home/data/state_repository/state_repository.dart';
import '../features/profile/data/profile_repository/profile_base_repository.dart';
import '../features/profile/data/profile_repository/profile_repository.dart';
import '../features/settings/data/auth_repository/auth_base_repository.dart';
import '../features/settings/data/auth_repository/auth_repository.dart';
import '../features/settings/data/themes_repository/themes_base_repository.dart';
import '../features/settings/data/themes_repository/themes_repository.dart';
import '../features/transaction/data/repository/transaction_base_repository.dart';
import '../features/transaction/data/repository/transaction_repository.dart';
import 'firebase_options.dart';
import 'models/transaction_hive_model.dart';
import 'service/network_info.dart';

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

  //sharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  //AuthUser
  final authUser = AuthUser();
  getIt.registerLazySingleton<AuthUserBase>(() => authUser);

  //UserService
  final userService = UserService();
  getIt.registerLazySingleton<UserServiceBase>(() => userService);

  //dbHiveClient
  final dbHiveClient = DbHiveClient();
  getIt.registerLazySingleton<DbHiveClientBase>(() => dbHiveClient);

  //InternetConnectionChecker
  final internetConnectionChecker = InternetConnectionChecker();
  getIt.registerLazySingleton(() => internetConnectionChecker);

  //networkInfo
  final networkInfo = NetworkInfo(getIt());
  getIt.registerLazySingleton<NetworkBaseInfo>(() => networkInfo);

  //=>
  // MainBaseRepository (MainRepository)
  final MainBaseRepository homeBaseRepository = MainRepository(
    dbFirestoreClient: getIt(),
    dbHiveClient: getIt(),
    authUser: getIt(),
  );

  //MainBloc && MainRepository
  getIt.registerLazySingleton(() => homeBaseRepository);
  getIt.registerFactory(() => MainCubit(mainRepository: getIt()));

  //=>
  // TransactionBaseRepository (TransactionRepository)
  final TransactionBaseRepository transactionRepository = TransactionRepository(
    dbFirestoreClient: getIt(),
    dbHiveClient: getIt(),
    authUser: getIt(),
  );

  //TransactionBloc && TransactionRepository
  getIt.registerLazySingleton(() => transactionRepository);
  getIt.registerFactory(() => TransactionCubit(transactionRepository: getIt()));

  //=>
  //AuthProfileBaseRepository (AuthProfileRepository)
  final AuthBaseRepository authProfileRepository = AuthRepository(
    userService: getIt(),
    authUser: getIt(),
  );

  //AuthProfileCubit && AuthProfileRepository
  getIt.registerLazySingleton(() => authProfileRepository);
  //AuthProfileCubit
  getIt.registerFactory(
    () => AuthCubit(
      authRepository: getIt(),
      userService: getIt(),
    ),
  );

  //=>
  //ProfileBaseRepository (profileRepository)
  final ProfileBaseRepository profileBaseRepository = ProfileRepository(
    userService: getIt(),
  );

  //ProfileBloc && ProfileRepository
  getIt.registerLazySingleton(() => profileBaseRepository);
  getIt.registerFactory(
    () => ProfileCubit(
      profileRepository: getIt(),
      networkInfo: getIt(),
    ),
  );

  //=>
  //StatBaseRepository (StatRepository)
  final StateBaseRepository stateBaseRepository = StateRepository(
    dbFirestoreClient: getIt(),
    dbHiveClient: getIt(),
    authUser: getIt(),
  );

  //StatBloc && StatRepository
  getIt.registerLazySingleton(() => stateBaseRepository);
  getIt.registerFactory(() => StateCubit(statBaseRepository: getIt()));
  //=>

  //ThemesBaseRepository (ThemesRepository)
  final ThemesBaseRepository themesBaseRepository = ThemesRepository(
    sharedPreferences: getIt(),
  );

  //ThemesCubit && ThemesRepository
  getIt.registerLazySingleton(() => themesBaseRepository);
  getIt.registerFactory(() => ThemesCubit(themesRepository: getIt()));

  //Hive
  await getIt<DbHiveClientBase>().initDb<TransactionHive>(
    boxName: 'transactions',
    onRegisterAdapter: () {
      Hive.registerAdapter(TransactionHiveAdapter());
      Hive.registerAdapter(CategoryHiveAdapter());
    },
  );
}
