import 'dart:developer' as developer;
import 'dart:developer' as develoepr;

import 'package:lostanimal/shared/utils/auth_error_from_code.dart';

import 'package:lostanimal/shared/models/result_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  //FIREBASE AUTOMATYCZNIE LOGUJE PO STWORZENIU KONTA
  Future<Result> createAccount(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      final user = credential.user;
      await user?.sendEmailVerification();
      return Result.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Result.failure('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Result.failure('The account already exists for that email.');
      } else {
        return Result.failure('Auth error: ${e.message}');
      }
    } catch (e) {
      return Result.failure('Ups something went wrong: $e');
    }
  }

  /*
  Caution: When a user uninstalls your app on iOS or macOS,
  the user's authentication state can persist between app re-installs,
   as the Firebase iOS SDK persists authentication state to the system
   keychain. See issue #4661 for more information.
   */

  /*
  Sesja logowania jest utrzymywana automatycznie przez Firebase Auth
  – nie musisz ręcznie zarządzać tokenami, dopóki korzystasz z Firebase SDK.
   */
  Future<Result> signIn(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return Result.success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Result.failure('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Result.failure('Wrong password provided for that user.');
      }
      return Result.failure('error');
    }
  }

  Future<Result> resetPassword(String emailAddress) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
    } on FirebaseAuthException catch (e, st) {
      if (e.code == 'network-request-failed') {
        return Result.failure(
          'Network error. Please check your internet connection and try again.',
        );
      }
      developer.log(
        'FirebaseAuthException: ${e.code}',
        error: e,
        stackTrace: st,
      );
    } catch (e, st) {
      developer.log(
        'Unknown error during password reset',
        error: e,
        stackTrace: st,
      );
    }
    return Result.info(
      'If we found an account with this email address, you’ll receive an email with instructions to reset your password.',
    );
  }

  Future<Result> changeEmail(String newEmail) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.verifyBeforeUpdateEmail(newEmail);
        return Result.success();
      } on FirebaseAuthException catch (e) {
        final authErr = authErrorFromCode(e.code);
        return Result.failure(authErr.toString(), code: authErr);
      }
    }
    return Result.failure('error');
  }

  Future<Result> changePassword(
    String newPassword,
    String currentPassword,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;

      await reAuthenticate(user.email!, currentPassword);

      await user.updatePassword(newPassword);

      developer.log('Password changed successfully for user: ${user.email}');
      return Result.success();
    } on FirebaseAuthException catch (e) {
      final code = authErrorFromCode(e.code);
      return Result.failure(e.message ?? 'Something went wrong', code: code);
    }
  }

  Future<Result> reAuthenticate(String email, String password) async {
    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(email: email, password: password);

    try {
      await user?.reauthenticateWithCredential(cred);
      return Result.success();
    } on FirebaseAuthException catch (e) {
      final code = authErrorFromCode(e.code);
      return Result.failure(e.message ?? 'Authentication error', code: code);
    }
  }

  Future<Result> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Result.success();
    } on FirebaseAuthException catch (e) {
      final code = authErrorFromCode(e.code);
      return Result.failure(e.message ?? 'Something went wrong', code: code);
    }
  }

  Future<Result> signInAnon() async {
    try {
      final credential = await FirebaseAuth.instance.signInAnonymously();
      developer.log('Zalogowano anonimowo: UID = ${credential.user?.uid}');
      return Result.success();
    } on FirebaseAuth catch (e) {
      return Result.failure('Something went wrong');
    }
  }

  Future<Result> linkWithCredential(AuthCredential authCredential) async {
    try {
      await FirebaseAuth.instance.currentUser?.linkWithCredential(
        authCredential,
      );
      return Result.success();
    } on FirebaseAuthException catch (e) {
      final code = authErrorFromCode(e.code);
      return Result.failure('Something went wrong');
    }
  }
}
