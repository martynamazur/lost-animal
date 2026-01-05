import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lostanimal/shared/widgets/dialog_confirmation.dart';
import 'package:lostanimal/features/auth/widgets/password_field.dart';
import 'package:lostanimal/features/auth/widgets/password_rules.dart';
import 'package:lostanimal/features/auth/provider/auth_notifier.dart';
import 'package:lostanimal/features/auth/provider/password_input_provider.dart';

import '../provider/auth_notifier.dart';

@RoutePage()
class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _keyForm = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change password')),
      body: SafeArea(
        child: FormBuilder(
          key: _keyForm,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        PasswordField(
                          label: 'Current password',
                          name: 'password',
                        ),
                        PasswordField(
                          label: 'New password',
                          name: 'newPassword',
                          onChanged: (value) {
                            ref
                                .read(passwordInputNotifierProvider.notifier)
                                .update(value!);
                          },
                        ),
                        PasswordRules(),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () async {
                              if (_keyForm.currentState?.saveAndValidate() ??
                                  false) {
                                final currentPassword =
                                    _keyForm.currentState?.value['password'];
                                final newPassword =
                                    _keyForm.currentState?.value['newPassword'];

                                await ref
                                    .read(authNotifierProvider.notifier)
                                    .onChangePassword(
                                      currentPassword,
                                      newPassword,
                                    );

                                final authState = ref.read(
                                  authNotifierProvider,
                                );
                                authState.when(
                                  data: (_) {
                                    _showPasswordChangeSuccessDialog();
                                    context.router.pop();
                                  },
                                  error: (error, _) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(error.toString())),
                                    );
                                  },
                                  loading: () {},
                                );
                              }
                            },
                            child: Text('Continue'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPasswordChangeSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return DialogConfirmation(
          title: 'Success',
          message: 'Your password has been changed successfully.',
          icon: Icons.password,
        );
      },
    );
  }
}
