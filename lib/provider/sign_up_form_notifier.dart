import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'sign_up_form_notifier.g.dart';

@riverpod
class SignUpFormNotifier extends _$SignUpFormNotifier {

  @override
  FutureOr<void> build() async {
    return ;
  }

  Future<void> signUp(String emailAddress, String password) async{
    state = const AsyncLoading();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = credential.user;
      await user?.sendEmailVerification();
      state = const AsyncData(null);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        state = AsyncError('The password provided is too weak.', StackTrace.current);
      } else if (e.code == 'email-already-in-use') {
        state =  AsyncError('The account already exists for that email.', StackTrace.current);
      } else {
        state =  AsyncError('Auth error: ${e.message}', StackTrace.current);
      }

    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }


}
