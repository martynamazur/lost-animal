import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/result_model.dart';

part 'user_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository();
}

@riverpod
Future<Result> createAccount(Ref ref, {required String emailAddress, required String password}) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.createAccount(emailAddress,password);
}

@riverpod
Future<Result> signIn(Ref ref, {required String emailAddress, required String password}) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.signIn(emailAddress,password);
}

@riverpod
Future<Result> signOut(Ref ref) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.signOut();
}

@riverpod
Future<Result> signInAnon(Ref ref) async {
  return ref.read(userRepositoryProvider).signInAnon();
}

@riverpod
Future<Result> resetPassword(Ref ref, {required String emailAddress}) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.resetPassword(emailAddress);
}

@riverpod
Future<Result> changeEmail(Ref ref, {required String newEmail}) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.changeEmail(newEmail);
}

@riverpod
Future<Result> reAuthenticate(Ref ref, {required String email, required String password}) async {
  return ref.read(userRepositoryProvider).reAuthenticate(email, password);
}

@riverpod
Future<Result> linkWithCredential(Ref ref, AuthCredential authCredential) async {
  return ref.read(userRepositoryProvider).linkWithCredential(authCredential);
}