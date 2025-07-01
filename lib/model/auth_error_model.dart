enum AuthError {
  requiresRecentLogin,
  invalidEmail,
  emailAlreadyInUse,
  userDisabled,
  networkError,
  unknown,
  wrongPassword, tooManyRequests,
  weakPassword
}
