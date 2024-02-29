import 'package:auth_user/src/auth_user_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/exception/exception.dart';

class AuthUser implements AuthUserBase {
  AuthUser({
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  /// The [firebaseAuth] is used to create an instance of [FirebaseAuth].
  final auth.FirebaseAuth _firebaseAuth;

  /// The [googleSignIn] is used to create an instance of [GoogleSignIn].
  final GoogleSignIn _googleSignIn;

  /// The [user] method is used to get user.
  @override
  Stream<auth.User?> get userStream => _firebaseAuth.authStateChanges();

  /// The [currentUser] method is used to get the current user.
  /// It returns the current user.
  /// If the user is not logged in, it returns null.
  /// If the user is logged in, it returns the current user.
  /// If there is an error, it throws an exception.
  @override
  auth.User? get currentUser => _firebaseAuth.currentUser;

  /// The [signInWithGoogle] method is used to sign up with google.
  /// It returns the user.
  @override
  Future<auth.User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      debugPrint('userCredential: ${userCredential.user}');

      return userCredential.user;
    } on auth.FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code}');
      throw SignInWithGoogleFailure.fromCode(e.code);
    } catch (e) {
      debugPrint('FirebaseAuthException: $e');
      throw const SignInWithGoogleFailure();
    }
  }

  /// The [signOut] method is used to sign out.
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
