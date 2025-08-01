import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/password_field.dart';

import '../../nawigation/app_router.dart';
import '../../provider/auth_notifier.dart';
import 'email_field.dart';

class LoginForm extends ConsumerWidget {
  final GlobalKey<FormBuilderState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 12.0,
      children: [
        EmailField(),
        PasswordField(),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed:() =>
                  _onSignInByEmail(context, ref),
              child: Text('Sign in')),
        ),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: () => context.router.push(SignUpRoute()),
              child: Text('Are you new here ? Sign up')
          ),
        ),
      ],
    );
  }
  void _onSignInByEmail(BuildContext context, WidgetRef ref) async{
    final messenger = ScaffoldMessenger.of(context);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    if(formKey.currentState?.saveAndValidate() ?? false){
      final formData = formKey.currentState!.value;
      final email = formData['email'];
      final password = formData['password'];
      await authNotifier.onSignInWithEmail(email, password);

    }else{
      messenger.showSnackBar(SnackBar(content: Text('Wypelnij pola')));
    }
  }
}


