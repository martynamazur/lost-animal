import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lostanimal/features/user/provider/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../notifications/fcm_token_service.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> onSignInWithEmail(String email, String password) async {
    state = const AsyncLoading();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await ref.read(userRepositoryProvider).createOrUpdateUserProfile();
      await FCMTokenService.initialize();

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = AsyncError('No user found for that email.', StackTrace.current);
      } else if (e.code == 'wrong-password') {
        state = AsyncError(
          'Wrong password provided for that user.',
          StackTrace.current,
        );
      } else {
        state = AsyncError('An unexpected error occurred.', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }

  Future<void> onSignInAnon() async {
    state = AsyncLoading();
    try {
      final credential = await FirebaseAuth.instance.signInAnonymously();

      await ref
          .read(userRepositoryProvider)
          .createOrUpdateUserProfile(displayName: 'Anonymous User');
      await FCMTokenService.initialize();

      state = AsyncData(null);
    } on FirebaseAuthException catch (e) {
      state = AsyncError(e, StackTrace.current);
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }

  Future<void> onSignInGoogle() async {
    state = AsyncLoading();
    try {
      final account = await GoogleSignIn.instance.authenticate();
      await FCMTokenService.initialize();
      state = AsyncData(null);
    } on FirebaseAuthException catch (e, st) {
    } catch (e) {
      state = AsyncError('An unexpected error occurred.', StackTrace.current);
    }
  }

  Future<void> onResetPassword(String email) async {
    state = const AsyncLoading();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      state = const AsyncData(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = AsyncError('No user found for that email.', StackTrace.current);
      } else {
        state = AsyncError('Failed to send reset email.', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }

  Future<void> onSignOut() async {
    state = const AsyncLoading();
    try {
      await FCMTokenService.removeTokens();
      await FirebaseAuth.instance.signOut();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError('Failed to sign out.', st);
    }
  }

  Future<void> onChangePassword(
    String currentPassword,
    String newPassword,
  ) async {
    state = const AsyncLoading();
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        state = AsyncError('No authenticated user', StackTrace.current);
        return;
      }

      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        state = AsyncError('Incorrect current password.', StackTrace.current);
      } else if (e.code == 'weak-password') {
        state = AsyncError('The new password is too weak.', StackTrace.current);
      } else {
        state = AsyncError(
          'Failed to change password: ${e.message}',
          StackTrace.current,
        );
      }
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }

  Future<void> onReAuthenticate(String email, String password) async {
    state = const AsyncLoading();
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        state = AsyncError('No authenticated user', StackTrace.current);
        return;
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        state = AsyncError('Wrong password. Try again.', StackTrace.current);
      } else if (e.code == 'network-request-failed') {
        state = AsyncError(
          'Check your internet connection.',
          StackTrace.current,
        );
      } else {
        state = AsyncError(
          'Re-authentication failed: ${e.message}',
          StackTrace.current,
        );
      }
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }

  Future<void> onChangeEmail(String newEmail) async {
    state = const AsyncLoading();
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        state = AsyncError('No authenticated user', StackTrace.current);
        return;
      }

      await user.updateEmail(newEmail);

      await ref
          .read(userRepositoryProvider)
          .createOrUpdateUserProfile(email: newEmail);

      state = const AsyncData(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        state = AsyncError('requires-recent-login', StackTrace.current);
      } else if (e.code == 'email-already-in-use') {
        state = AsyncError(
          'This email is already in use by another account.',
          StackTrace.current,
        );
      } else if (e.code == 'invalid-email') {
        state = AsyncError(
          'The email address is not valid.',
          StackTrace.current,
        );
      } else {
        state = AsyncError(
          'Failed to change email: ${e.message}',
          StackTrace.current,
        );
      }
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }
}
