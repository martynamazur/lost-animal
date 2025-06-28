import '../model/auth_error_model.dart';

AuthError authErrorFromCode(String code) {
  switch (code) {
    case 'requires-recent-login':
      return AuthError.requiresRecentLogin;
    case 'invalid-email':
      return AuthError.invalidEmail;
    case 'email-already-in-use':
      return AuthError.emailAlreadyInUse;
    case 'user-disabled':
      return AuthError.userDisabled;
    case 'network-request-failed':
      return AuthError.networkError;
    case 'wrong-password':
      return AuthError.wrongPassword;
    case 'too-many-requests':
      return AuthError.tooManyRequests;
    default:
      return AuthError.unknown;
  }
}
