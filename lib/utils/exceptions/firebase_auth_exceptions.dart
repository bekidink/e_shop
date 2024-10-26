class TFirebaseAuthException implements Exception {
  final String code;
  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'user-not-found':
        return 'No user found with this email. Please check the email and try again.';
      case 'wrong-password':
        return 'The password is incorrect. Please try again or reset your password.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password with at least 6 characters.';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support for help.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'too-many-requests':
        return 'Too many requests have been made. Please wait a moment and try again.';
      case 'network-request-failed':
        return 'Network error occurred. Please check your internet connection and try again.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new one.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please request a new one.';
      case 'requires-recent-login':
        return 'This action requires a recent login. Please log in again and try.';
      case 'credential-already-in-use':
        return 'The account associated with this credential is already in use. Please use a different account.';
      case 'invalid-credential':
        return 'The credential provided is invalid. Please try again.';
      case 'invalid-verification-code':
        return 'The verification code is invalid. Please check the code and try again.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid. Please check the ID and try again.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
