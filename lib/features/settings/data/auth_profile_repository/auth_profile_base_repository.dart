import 'package:daily_expense_tracker_app/core/utils/models/app_result.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:user_service/user_service.dart';

abstract class AuthProfileBaseRepository {
  /// The [user] stream is used to get the user.
  Stream<auth.User?> get userStream;

  /// The [currentUser] method is used to get the current user.
  /// It returns the current user.
  auth.User? get currentUser;

  /// The [signInWithGoogle] method is used to sign in with google.
  Future<AppResult<User>> signUpWithGoogle();

  /// The [signOut] method is used to sign out.
  Future<AppResult<void>> signOut();
}
