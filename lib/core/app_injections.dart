import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';

final getIt = GetIt.I;

Future<void> initAppConfig() async {
  // Initialize [FirebaseApp].
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //sharedPreferences
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);
}
