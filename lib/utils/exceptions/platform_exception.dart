class TPlatformException implements Exception {
  final String code;
  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'network-error':
        return 'A network error occurred. Please check your internet connection and try again.';
      case 'permission-denied':
        return 'Permission denied. Please grant the necessary permissions in your device settings.';
      case 'file-not-found':
        return 'The requested file was not found. Please check the file path and try again.';
      case 'unsupported-platform':
        return 'This feature is not supported on your current platform. Please check compatibility.';
      case 'location-not-enabled':
        return 'Location services are not enabled. Please enable location services in your device settings.';
      case 'feature-not-available':
        return 'This feature is not available on your device. Please check your device specifications.';
      case 'camera-access-denied':
        return 'Camera access is denied. Please allow camera access in your device settings.';
      case 'microphone-access-denied':
        return 'Microphone access is denied. Please allow microphone access in your device settings.';
      case 'unexpected-error':
        return 'An unexpected platform error occurred. Please try again or contact support.';
      default:
        return 'An unknown platform error occurred. Please try again.';
    }
  }
}
