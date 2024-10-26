class TFirebaseException implements Exception {
  final String code;
  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'permission-denied':
        return 'You do not have permission to perform this action. Please contact support.';
      case 'unavailable':
        return 'The service is currently unavailable. Please try again later.';
      case 'aborted':
        return 'The operation was aborted. Please try again.';
      case 'data-loss':
        return 'Data loss occurred. Please contact support if the issue persists.';
      case 'deadline-exceeded':
        return 'The operation took too long to complete. Please try again.';
      case 'already-exists':
        return 'The item already exists. Please try a different value.';
      case 'not-found':
        return 'The requested resource was not found. Please check the information and try again.';
      case 'resource-exhausted':
        return 'The quota for this resource has been exhausted. Please try again later.';
      case 'failed-precondition':
        return 'The operation could not be completed due to a failed precondition. Please check your request and try again.';
      case 'cancelled':
        return 'The operation was cancelled. Please try again if needed.';
      case 'unknown':
        return 'An unknown error occurred. Please try again later.';
      case 'invalid-argument':
        return 'The provided arguments are invalid. Please check your input and try again.';
      case 'out-of-range':
        return 'The requested value is out of the allowed range. Please try again with a valid value.';
      case 'unauthenticated':
        return 'You need to be authenticated to perform this action. Please log in and try again.';
      case 'internal':
        return 'An internal error occurred. Please try again later.';
      case 'unimplemented':
        return 'This operation is not implemented. Please contact support if the issue persists.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
