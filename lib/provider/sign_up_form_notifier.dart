import 'package:firebase_auth/firebase_auth.dart';
import 'package:lostanimal/provider/user_provider.dart';
import 'package:lostanimal/utils/auth_error_from_code.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/auth_error_model.dart';
import '../model/result_model.dart';


part 'sign_up_form_notifier.g.dart';

@riverpod
class SignUpFormNotifier extends _$SignUpFormNotifier {

  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> signUp({required String emailAddress,required String password}) async{
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
      final authError = authErrorFromCode(e.code);

      final message = switch (authError) {
        AuthError.weakPassword => 'The password provided is too weak.',
        AuthError.emailAlreadyInUse => 'The account already exists for that email.',
        AuthError.invalidEmail => 'The email address is invalid.',
        AuthError.networkError => 'Network error occurred. Check your connection.',
        AuthError.tooManyRequests => 'Too many attempts. Try again later.',
        AuthError.userDisabled => 'This user account has been disabled.',
        _ => e.message ?? 'Authentication failed.'
      };
      
      state = AsyncError(message, StackTrace.current);

    } catch (e, st) {
      state = AsyncError('An unexpected error occurred.', st);
    }
  }

  Future<void> linkAnonymousAccount({required String emailAddress,required String password}) async{
      final AuthCredential credential = EmailAuthProvider.credential(email: emailAddress, password: password);
      final Result result = await ref.read(linkWithCredentialProvider(credential).future);
      if(result.success){
        state = AsyncData(null);
      }else{
        state = AsyncError(result.errorMessage ?? 'Something went wrong', StackTrace.current);
      }
  }
}
