/// Exception thrown when there is a failure during sign in with Google.
class SignInWithGoogleFailure implements Exception {
  final String message;

  const SignInWithGoogleFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory SignInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const SignInWithGoogleFailure(
          'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
        );
      case 'invalid-credential':
        return const SignInWithGoogleFailure(
          'The credential data is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const SignInWithGoogleFailure(
          'Google sign-in is not enabled. Please enable Google sign in on the Firebase console.',
        );
      case 'user-disabled':
        return const SignInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignInWithGoogleFailure(
          'No user found for that email.',
        );
      case 'wrong-password':
        return const SignInWithGoogleFailure(
          'Wrong password. Please try again.',
        );
      case 'invalid-verification-code':
        return const SignInWithGoogleFailure(
          'The verification code is invalid. Please try again.',
        );
      case 'invalid-verification-id':
        return const SignInWithGoogleFailure(
          'The verification ID is invalid. Please try again.',
        );

      case 'invalid-email':
        return const SignInWithGoogleFailure(
          'Email is not valid or badly formatted.',
        );
      case 'network-request-failed':
        return const SignInWithGoogleFailure(
          'Please check your internet connection and try again.',
        );

      case 'too-many-requests':
        return const SignInWithGoogleFailure(
          'Too many requests. Please try again later.',
        );

      case 'invalid-email-verified':
        return const SignInWithGoogleFailure(
          'Email is not valid or badly formatted.',
        );

      case 'sign_up_failed':
        return const SignInWithGoogleFailure(
          'Sign in failed. Please try again.',
        );

      default:
        return const SignInWithGoogleFailure();
    }
  }
  @override
  String toString() => message;
}
