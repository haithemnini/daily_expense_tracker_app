import 'package:auth_user/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:user_service/user_service.dart';

import '../../../../core/utils/models/app_result.dart';
import 'auth_base_repository.dart';

class AuthRepository implements AuthBaseRepository {
  final UserServiceBase _userService;
  final AuthUserBase _authUser;

  AuthRepository({
    required UserServiceBase userService,
    required AuthUserBase authUser,
  })  : _userService = userService,
        _authUser = authUser;

  /// The [currentUser] method is used to get the current user.
  /// It returns the current user.
  @override
  auth.User? get currentUser => _authUser.currentUser;

  /// The [signInWithEmailAndPassword] method is used to sign in with email and password.
  @override
  Future<AppResult<User>> signInWithGoogle() async {
    try {
      // Sign in with Google
      final user = await _authUser.signInWithGoogle();

      // Check if the user already exists in the database
      final existingUser = await _userService.getUser(user!.uid).first;

      if (existingUser == null) {
        // The user does not exist in the database, create a new user
        final createdUser = await _userService.createUser(
          User(
            uuid: user.uid,
            email: user.email!,
            fullName: user.displayName!,
            photoUrl: user.photoURL,
          ),
        );
        return AppResult.success(createdUser);
      } else {
        // The user already exists in the database
        return AppResult.success(existingUser);
      }
    } on SignInWithGoogleFailure catch (err) {
      debugPrint('AuthProfileRepository: signUpWithGoogle: $err');
      return AppResult.failure(err.message);
    } catch (err) {
      return AppResult.failure(err.toString());
    }
  }

  /// The [signOut] method is used to sign out.
  @override
  Future<AppResult<void>> signOut() async {
    try {
      await _authUser.signOut();
      return const AppResult.success(null);
    } catch (err) {
      return AppResult.failure(err.toString());
    }
  }
}
