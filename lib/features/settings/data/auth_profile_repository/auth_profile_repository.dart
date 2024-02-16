import 'package:auth_user/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:user_service/user_service.dart';

import '../../../../core/utils/models/app_result.dart';
import 'auth_profile_base_repository.dart';

class AuthProfileRepository implements AuthProfileBaseRepository {
  final UserServiceBase _userService;
  final AuthUserBase _authUser;

  AuthProfileRepository({
    required UserServiceBase userService,
    required AuthUserBase authUser,
  })  : _userService = userService,
        _authUser = authUser;

  /// The [user] method is used to get user.
  @override
  Stream<auth.User?> get userStream => _authUser.user;

  /// The [currentUser] method is used to get the current user.
  /// It returns the current user.
  @override
  auth.User? get currentUser => _authUser.currentUser;

  /// The [signInWithEmailAndPassword] method is used to sign in with email and password.
  @override
  Future<AppResult<User>> signUpWithGoogle() async {
    try {
      /// The [signUpWithGoogle] method is used to sign up with google.
      final user = await _authUser.signUpWithGoogle();

      /// The [createUser] method is used to create user.
      /// The [user] is the user model.
      final createdUser = await _userService.createUser(User(
        uuid: user!.uid,
        email: user.email!,
        fullName: user.displayName!,
        photoUrl: user.photoURL,
      ));

      return AppResult.success(createdUser);
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
