import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/auth_error_model.dart';
import '../../../shared/models/result_model.dart';
import '../../user/provider/user_provider.dart';
import '../widgets/password_field.dart';

@RoutePage()
class ReAuthPasswordScreen extends ConsumerStatefulWidget {
  final String newEmail;
  const ReAuthPasswordScreen(this.newEmail, {super.key});

  @override
  ConsumerState createState() => _ReAuthPasswordScreenState();
}

class _ReAuthPasswordScreenState extends ConsumerState<ReAuthPasswordScreen> {
  final keyForm = GlobalKey<FormBuilderState>();
  late FocusNode _passwordFocus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Re-authenticate')),
      body: SafeArea(
        child: FormBuilder(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    Text(
                      'To change your email, please re-enter your password.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    PasswordField(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          final messenger = ScaffoldMessenger.of(context);
                          if (keyForm.currentState?.saveAndValidate() ??
                              false) {
                            final password =
                                keyForm.currentState?.value['password'];
                            final Result result = await ref.read(
                              reAuthenticateProvider(
                                email: widget.newEmail,
                                password: password,
                              ).future,
                            );
                            if (result.success) {
                              final Result result = await ref.read(
                                changeEmailProvider(
                                  newEmail: widget.newEmail,
                                ).future,
                              );
                              if (result.success) {
                                _showEmailChangeSuccessDialog();
                              } else {
                                messenger.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      result.errorMessage ??
                                          'Something went wrong',
                                    ),
                                  ),
                                );
                              }
                            } else {
                              switch (result.code) {
                                case AuthError.wrongPassword:
                                  final formState = keyForm.currentState;
                                  formState?.fields['password']?.invalidate(
                                    'Wrong password. Try again.',
                                  );
                                  _passwordFocus.requestFocus();
                                  messenger.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Wrong password. Try again.',
                                      ),
                                    ),
                                  );
                                  break;
                                case AuthError.networkError:
                                  messenger.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Check your internet connection.',
                                      ),
                                    ),
                                  );
                                  break;
                                default:
                                  messenger.showSnackBar(
                                    SnackBar(
                                      content: Text(result.errorMessage!),
                                    ),
                                  );
                              }
                            }
                          }
                        },
                        child: Text('Next'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showEmailChangeSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your email has been changed successfully.'),
          actions: [
            FilledButton(
              onPressed: () =>
                  context.router.popUntilRouteWithName('SettingsRoute'),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
