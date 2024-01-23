// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDbc02PXK_mIy6zc7gxDIE-CBzgLJwcvLo',
    appId: '1:800188863112:web:e384020e1d1c58a85f053d',
    messagingSenderId: '800188863112',
    projectId: 'daily-expense-tracker-123e1',
    authDomain: 'daily-expense-tracker-123e1.firebaseapp.com',
    storageBucket: 'daily-expense-tracker-123e1.appspot.com',
    measurementId: 'G-M8LCZRBLQS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDC7TRqG_rifjnlAh1UHPrcB3tmVt979WQ',
    appId: '1:800188863112:android:fe4ed12bb40ba62b5f053d',
    messagingSenderId: '800188863112',
    projectId: 'daily-expense-tracker-123e1',
    storageBucket: 'daily-expense-tracker-123e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_8iWOFNHMo-36B866eEJFyW279aiZfOM',
    appId: '1:800188863112:ios:0923cbc2198d87dc5f053d',
    messagingSenderId: '800188863112',
    projectId: 'daily-expense-tracker-123e1',
    storageBucket: 'daily-expense-tracker-123e1.appspot.com',
    iosBundleId: 'com.example.dailyExpenseTrackerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_8iWOFNHMo-36B866eEJFyW279aiZfOM',
    appId: '1:800188863112:ios:0b1eb9f3793afcf15f053d',
    messagingSenderId: '800188863112',
    projectId: 'daily-expense-tracker-123e1',
    storageBucket: 'daily-expense-tracker-123e1.appspot.com',
    iosBundleId: 'com.example.dailyExpenseTrackerApp.RunnerTests',
  );
}