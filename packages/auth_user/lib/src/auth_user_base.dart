import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthUserBase {
  /// The [user] stream is used to get the user.
  Stream<auth.User?> get userStream;

  /// The [currentUser] method is used to get the current user.
  /// It returns the current user.
  auth.User? get currentUser;

  /// The [signInWithGoogle] method is used to sign in with google.
  Future<auth.User?> signInWithGoogle();

  /// The [signOut] method is used to sign out.
  Future<void> signOut();
}
