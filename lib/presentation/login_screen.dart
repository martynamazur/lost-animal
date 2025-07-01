import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lostanimal/presentation/home_screen.dart';
import 'package:lostanimal/presentation/widget/email_field.dart';
import 'package:lostanimal/presentation/widget/password_field.dart';
import 'package:lostanimal/provider/auth_notifier.dart';
import 'package:lostanimal/provider/user_provider.dart';
import 'package:lostanimal/service/google_auth_service.dart';


import '../nawigation/app_router.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    ref.listen<AsyncValue<void>>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          context.router.replaceAll([DashboardRoute()]);
        },
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(err.toString())),
          );
        },
      );
    });

    return Scaffold(
      body: SafeArea(
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 12,
                children: [
                  EmailField(),
                  PasswordField(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () => context.router.push(ResetPasswordRoute()),
                          child: Text('Forgot your password ?')
                      ),
                    ],
                  ),

                  authState.isLoading ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed:() =>
                          _onSignInByEmail(),
                      child: Text('Sign in')
                  ),

                  OutlinedButton(
                      onPressed: () => context.router.push(SignUpRoute()),
                      child: Text('Are you new here ? Sign up')
                  ),


                  authState.isLoading ? const CircularProgressIndicator()
                  : OutlinedButton(
                      onPressed: () => authNotifier.onSignInAnon(),
                      child: Text('Continue without account')
                  ),


                  authState.isLoading ? const CircularProgressIndicator()
                  : OutlinedButton(
                        onPressed: () => authNotifier.onSignInGoogle(),
                        child: Text('Continuue with google')
                    )
                ],
              ),
            )
          )
      ),
    );
  }

  void _onSignInByEmail() async{
    final messenger = ScaffoldMessenger.of(context);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    if(_formKey.currentState?.saveAndValidate() ?? false){
      final formData = _formKey.currentState!.value;
      final email = formData['email'];
      final password = formData['password'];
      await authNotifier.onSignInWithEmail(email, password);

    }else{
      messenger.showSnackBar(SnackBar(content: Text('Wypelnij pola')));
    }
  }


}
