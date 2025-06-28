import 'package:firebase_auth/firebase_auth.dart';
import 'package:lostanimal/provider/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> login(String email, String password) async {
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
        state = AsyncError('Wrong password provided for that user.', StackTrace.current);
      } else {
        state = AsyncError('An unexpected error occurred.', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }
}
