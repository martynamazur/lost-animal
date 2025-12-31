import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state_result.freezed.dart';

@freezed
abstract class AuthStateResult with _$AuthStateResult {
  const factory AuthStateResult({
    required bool isAuthenticated,
    required bool requiresVerification,
    User? user,
    String? reason,
  }) = _AuthStateResult;

  /// Użytkownik jest w pełni uwierzytelniony
  factory AuthStateResult.authenticated(User user) => AuthStateResult(
    isAuthenticated: true,
    requiresVerification: false,
    user: user,
  );

  /// Użytkownik nie jest uwierzytelniony
  factory AuthStateResult.notAuthenticated({String? reason}) => AuthStateResult(
    isAuthenticated: false,
    requiresVerification: false,
    reason: reason,
  );

  /// Użytkownik jest zalogowany ale wymaga weryfikacji email
  factory AuthStateResult.requiresVerification() =>
      const AuthStateResult(isAuthenticated: false, requiresVerification: true);
}
