/// Exception thrown when there is a failure during sign up with email and password.
class SignUpFailure implements Exception {
  /// The associated error message.
  final String message;

  const SignUpFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory SignUpFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpFailure();
    }
  }
}

/// Exception thrown when there is a failure during sign in with email and password.
class SignInFailure implements Exception {
  /// The associated error message.
  final String message;

  const SignInFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory SignInFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignInFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignInFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignInFailure(
          'No user found for that email.',
        );
      case 'wrong-password':
        return const SignInFailure(
          'Wrong password. Please try again.',
        );
      case 'network-request-failed':
        return const SignInFailure(
          'Please check your internet connection and try again.',
        );
      case 'too-many-requests':
        return const SignInFailure(
          'Too many requests. Please try again later.',
        );
      case 'operation-not-allowed':
        return const SignInFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'invalid-verification-code':
        return const SignInFailure(
          'The verification code is invalid. Please try again.',
        );
      case 'invalid-verification-id':
        return const SignInFailure(
          'The verification ID is invalid. Please try again.',
        );
      case 'invalid-credential':
        return const SignInFailure(
          'The credential data is malformed or has expired.',
        );
      case 'account-exists-with-different-credential':
        return const SignInFailure(
          'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
        );

      default:
        return const SignInFailure();
    }
  }

  @override
  String toString() => message;
}

/// Exception thrown when there is a failure during restore password with email.
class ForgotPasswordFailure implements Exception {
  final String message;

  const ForgotPasswordFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory ForgotPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const ForgotPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const ForgotPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const ForgotPasswordFailure(
          'No user found for that email.',
        );
      case 'wrong-password':
        return const ForgotPasswordFailure(
          'Wrong password. Please try again.',
        );
      case 'network-request-failed':
        return const ForgotPasswordFailure(
          'Please check your internet connection and try again.',
        );
      case 'too-many-requests':
        return const ForgotPasswordFailure(
          'Too many requests. Please try again later.',
        );
      case 'operation-not-allowed':
        return const ForgotPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'invalid-verification-code':
        return const ForgotPasswordFailure(
          'The verification code is invalid. Please try again.',
        );
      case 'invalid-verification-id':
        return const ForgotPasswordFailure(
          'The verification ID is invalid. Please try again.',
        );
      case 'invalid-credential':
        return const ForgotPasswordFailure(
          'The credential data is malformed or has expired.',
        );
      case 'account-exists-with-different-credential':
        return const ForgotPasswordFailure(
          'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
        );

      default:
        return const ForgotPasswordFailure();
    }
  }

  @override
  String toString() => message;
}

/// Exception thrown when there is a failure during LogOut out with email and password.
class SignOutFailure implements Exception {
  final String message;

  const SignOutFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory SignOutFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignOutFailure('Email is not valid or badly formatted.');
      case 'user-disabled':
        return const SignOutFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignOutFailure('No user found for that email.');
      case 'wrong-password':
        return const SignOutFailure('Wrong password. Please try again.');

      default:
        return const SignOutFailure();
    }
  }

  @override
  String toString() => message;
}

/// Exception thrown when there is a failure Verifying email with email and password.
class VerifyEmailFailure implements Exception {
  final String message;

  const VerifyEmailFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory VerifyEmailFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const VerifyEmailFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const VerifyEmailFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const VerifyEmailFailure(
          'No user found for that email.',
        );
      case 'wrong-password':
        return const VerifyEmailFailure(
          'Wrong password. Please try again.',
        );
      case 'network-request-failed':
        return const VerifyEmailFailure(
          'Please check your internet connection and try again.',
        );
      case 'too-many-requests':
        return const VerifyEmailFailure(
          'Too many requests. Please try again later.',
        );
      case 'invalid-email-verified':
        return const VerifyEmailFailure(
          'Email is not valid or badly formatted.',
        );
      case 'operation-not-allowed':
        return const VerifyEmailFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'invalid-verification-code':
        return const VerifyEmailFailure(
          'The verification code is invalid. Please try again.',
        );
      case 'invalid-verification-id':
        return const VerifyEmailFailure(
          'The verification ID is invalid. Please try again.',
        );
      case 'invalid-credential':
        return const VerifyEmailFailure(
          'The credential data is malformed or has expired.',
        );
      case 'account-exists-with-different-credential':
        return const VerifyEmailFailure(
          'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
        );

      default:
        return const VerifyEmailFailure();
    }
  }

  @override
  String toString() => message;
}

/// Exception thrown when there is a failure during sign in with Google.
class SignUpOrSignInWithGoogleFailure implements Exception {
  final String message;

  const SignUpOrSignInWithGoogleFailure([
    this.message = 'Unknown error occurred.',
  ]);

  factory SignUpOrSignInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const SignUpOrSignInWithGoogleFailure(
          'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
        );
      case 'invalid-credential':
        return const SignUpOrSignInWithGoogleFailure(
          'The credential data is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const SignUpOrSignInWithGoogleFailure(
          'Google sign-in is not enabled. Please enable Google sign in on the Firebase console.',
        );
      case 'user-disabled':
        return const SignUpOrSignInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignUpOrSignInWithGoogleFailure(
          'No user found for that email.',
        );
      case 'wrong-password':
        return const SignUpOrSignInWithGoogleFailure(
          'Wrong password. Please try again.',
        );
      case 'invalid-verification-code':
        return const SignUpOrSignInWithGoogleFailure(
          'The verification code is invalid. Please try again.',
        );
      case 'invalid-verification-id':
        return const SignUpOrSignInWithGoogleFailure(
          'The verification ID is invalid. Please try again.',
        );

      case 'invalid-email':
        return const SignUpOrSignInWithGoogleFailure(
          'Email is not valid or badly formatted.',
        );
      case 'network-request-failed':
        return const SignUpOrSignInWithGoogleFailure(
          'Please check your internet connection and try again.',
        );

      case 'too-many-requests':
        return const SignUpOrSignInWithGoogleFailure(
          'Too many requests. Please try again later.',
        );

      case 'invalid-email-verified':
        return const SignUpOrSignInWithGoogleFailure(
          'Email is not valid or badly formatted.',
        );

      default:
        return const SignUpOrSignInWithGoogleFailure();
    }
  }
  @override
  String toString() => message;
}
