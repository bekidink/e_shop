class TFormatException implements Exception {
  final String code;
  TFormatException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address format is invalid. Please enter a valid email address.';
      case 'invalid-phone-number':
        return 'The phone number format is invalid. Please enter a valid phone number.';
      case 'invalid-date':
        return 'The date format is incorrect. Please use the correct format (e.g., YYYY-MM-DD).';
      case 'empty-field':
        return 'A required field is empty. Please fill in all necessary fields.';
      case 'invalid-number':
        return 'The number format is invalid. Please enter a valid numeric value.';
      case 'invalid-url':
        return 'The URL format is incorrect. Please enter a valid URL.';
      case 'invalid-json':
        return 'The JSON format is invalid. Please check the structure and content.';
      case 'invalid-password':
        return 'The password format is invalid. Ensure it meets the required criteria (e.g., length, special characters).';
      default:
        return 'An unknown formatting error occurred. Please try again.';
    }
  }
}
