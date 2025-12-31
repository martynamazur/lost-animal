import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
      developer.log('Zalogowano anonimowo: UID = ${credential.user?.uid}');
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
      //final googleAuthService = GoogleAuthService();
      final account = await GoogleSignIn.instance.authenticate();
      developer.log(account.email);
      state = AsyncData(null);
    } on FirebaseAuthException catch (e, st) {
    } catch (e) {}
  }
}
