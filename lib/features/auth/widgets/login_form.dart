import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/features/auth/widgets/password_field.dart';

import 'package:lostanimal/features/auth/provider/auth_notifier.dart';
import '../../../core/router/app_router.dart';
import 'email_field.dart';

class LoginForm extends ConsumerWidget {
  final GlobalKey<FormBuilderState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 12.0,
      children: [
        EmailField(label: 'Email'),
        PasswordField(),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () async {
              await context.router.push(ResetPasswordRoute());
              formKey.currentState?.reset();
            },
            child: const Text('Forgot password?'),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () => _onSignInByEmail(context, ref),
            child: const Text('Sign in'),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => context.router.push(SignUpRoute()),
            child: const Text('Are you new here ? Sign up'),
          ),
        ),
      ],
    );
  }

  void _onSignInByEmail(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;
      final email = formData['email'];
      final password = formData['password'];
      await authNotifier.onSignInWithEmail(email, password);
    } else {
      messenger.showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }
}
