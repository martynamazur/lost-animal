import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/auth_state_result.dart';
import '../../notifications/fcm_token_service.dart';
import '../data/auth_cleanup_service.dart';

part 'auth_gate_notifier.g.dart';

@riverpod
class AuthGateNotifier extends _$AuthGateNotifier {
  @override
  FutureOr<AuthStateResult> build() async {
    return await validateAuthState();
  }

  Future<AuthStateResult> validateAuthState() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return AuthStateResult.notAuthenticated();
      }

      final isTokenValid = await _validateToken(user);

      if (!isTokenValid) {
        await _cleanupAndSignOut();
        return AuthStateResult.notAuthenticated(reason: 'Token expired');
      }

      if (_requiresEmailVerification(user)) {
        return AuthStateResult.requiresVerification();
      }

      return AuthStateResult.authenticated(user);
    } catch (e, stackTrace) {
      await _cleanupAndSignOut();
      return AuthStateResult.notAuthenticated(reason: 'Validation error: $e');
    }
  }

  Future<bool> _validateToken(User user) async {
    try {
      final idTokenResult = await user.getIdTokenResult(true);

      final expirationTime = idTokenResult.expirationTime;
      final now = DateTime.now();

      if (expirationTime != null && now.isAfter(expirationTime)) {
        return false;
      }

      final issuedAt = idTokenResult.issuedAtTime;
      if (issuedAt != null) {
        final tokenAge = now.difference(issuedAt);
        const maxTokenAge = Duration(days: 30);

        if (tokenAge > maxTokenAge) {
          return false;
        }
      }

      await user.reload();
      final refreshedUser = FirebaseAuth.instance.currentUser;

      if (refreshedUser == null) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  bool _requiresEmailVerification(User user) {
    if (user.isAnonymous) return false;
    return !user.emailVerified;
  }

  Future<void> _cleanupAndSignOut() async {
    try {
      await FCMTokenService.removeTokens();

      final cleanupService = ref.read(authCleanupServiceProvider);
      await cleanupService.clearAllUserData();

      await FirebaseAuth.instance.signOut();
    } catch (e) {
      try {
        await FirebaseAuth.instance.signOut();
      } catch (signOutError) {
        // Silent fail
      }
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => validateAuthState());
  }
}
