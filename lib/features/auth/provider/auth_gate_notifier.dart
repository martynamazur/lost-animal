import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/auth_state_result.dart';
import '../data/auth_cleanup_service.dart';

part 'auth_gate_notifier.g.dart';

@riverpod
class AuthGateNotifier extends _$AuthGateNotifier {
  @override
  FutureOr<AuthStateResult> build() async {
    // Początkowy stan - sprawdź od razu
    return await validateAuthState();
  }

  /// Sprawdza stan autoryzacji i waliduje token
  Future<AuthStateResult> validateAuthState() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      // Brak użytkownika - nie zalogowany
      if (user == null) {
        developer.log('AuthGate: No user found');
        return AuthStateResult.notAuthenticated();
      }

      developer.log('AuthGate: User found - ${user.uid}');

      // Sprawdź czy token jest ważny
      final isTokenValid = await _validateToken(user);

      if (!isTokenValid) {
        developer.log('AuthGate: Token expired or invalid');

        // Token nieważny - wyczyść dane i wyloguj
        await _cleanupAndSignOut();
        return AuthStateResult.notAuthenticated(reason: 'Token expired');
      }

      // Opcjonalnie: sprawdź czy email jest zweryfikowany
      if (_requiresEmailVerification(user)) {
        developer.log('AuthGate: Email verification required');
        return AuthStateResult.requiresVerification();
      }

      developer.log('AuthGate: User authenticated successfully');
      return AuthStateResult.authenticated(user);
    } catch (e, stackTrace) {
      developer.log(
        'AuthGate: Error during validation',
        error: e,
        stackTrace: stackTrace,
      );

      // W przypadku błędu - wyczyść dane dla bezpieczeństwa
      await _cleanupAndSignOut();
      return AuthStateResult.notAuthenticated(reason: 'Validation error: $e');
    }
  }

  /// Waliduje token Firebase
  Future<bool> _validateToken(User user) async {
    try {
      // Pobierz świeży token i sprawdź jego ważność
      final idTokenResult = await user.getIdTokenResult(true);

      // Sprawdź czy token nie wygasł
      final expirationTime = idTokenResult.expirationTime;
      final now = DateTime.now();

      if (expirationTime != null && now.isAfter(expirationTime)) {
        developer.log(
          'AuthGate: Token expired at $expirationTime, now is $now',
        );
        return false;
      }

      // Sprawdź czy token został wydany niedawno (opcjonalne)
      final issuedAt = idTokenResult.issuedAtTime;
      if (issuedAt != null) {
        final tokenAge = now.difference(issuedAt);
        // Jeśli token jest starszy niż X dni, wymuś ponowne logowanie
        const maxTokenAge = Duration(days: 30);

        if (tokenAge > maxTokenAge) {
          developer.log('AuthGate: Token too old - issued $tokenAge ago');
          return false;
        }
      }

      // Sprawdź czy użytkownik nie został zablokowany/usunięty
      await user.reload();
      final refreshedUser = FirebaseAuth.instance.currentUser;

      if (refreshedUser == null) {
        developer.log('AuthGate: User no longer exists after reload');
        return false;
      }

      return true;
    } catch (e) {
      developer.log('AuthGate: Token validation failed', error: e);
      return false;
    }
  }

  /// Sprawdza czy wymagana jest weryfikacja email
  bool _requiresEmailVerification(User user) {
    // Pomiń weryfikację dla użytkowników anonimowych
    if (user.isAnonymous) return false;

    // Sprawdź czy email jest zweryfikowany
    return !user.emailVerified;
  }

  /// Czyści dane lokalne i wylogowuje użytkownika
  Future<void> _cleanupAndSignOut() async {
    try {
      developer.log('AuthGate: Starting cleanup and sign out');

      // Wyczyść dane lokalne przez serwis
      final cleanupService = ref.read(authCleanupServiceProvider);
      await cleanupService.clearAllUserData();

      // Wyloguj z Firebase
      await FirebaseAuth.instance.signOut();

      developer.log('AuthGate: Cleanup and sign out completed');
    } catch (e) {
      developer.log('AuthGate: Error during cleanup', error: e);
      // Nawet jeśli cleanup się nie powiedzie, spróbuj wylogować
      try {
        await FirebaseAuth.instance.signOut();
      } catch (signOutError) {
        developer.log('AuthGate: Sign out also failed', error: signOutError);
      }
    }
  }

  /// Wymusza ponowne sprawdzenie stanu autoryzacji
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => validateAuthState());
  }
}
