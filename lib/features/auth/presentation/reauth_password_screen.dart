import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../provider/auth_notifier.dart';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _passwordFocus = FocusNode();

    // Listen to auth state changes
    ref.listenManual(authNotifierProvider, (previous, next) {
      if (!mounted) return;

      next.when(
        data: (_) {
          if (_isLoading) {
            _isLoading = false;
            _showEmailChangeSuccessDialog();
          }
        },
        error: (error, _) {
          if (_isLoading) {
            setState(() => _isLoading = false);
            final errorMessage = error.toString();

            if (errorMessage.contains('Wrong password')) {
              final formState = keyForm.currentState;
              formState?.fields['password']?.invalidate(
                'Wrong password. Try again.',
              );
              _passwordFocus.requestFocus();
            }

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMessage)));
          }
        },
        loading: () {
          // Loading handled by _isLoading flag
        },
      );
    });
  }

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

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
                    FormBuilderTextField(
                      name: 'password',
                      focusNode: _passwordFocus,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: _isLoading
                            ? null
                            : () async {
                                if (keyForm.currentState?.saveAndValidate() ??
                                    false) {
                                  setState(() => _isLoading = true);

                                  final password =
                                      keyForm.currentState?.value['password'];

                                  // First re-authenticate, then change email
                                  await _performReAuthAndChangeEmail(password);
                                }
                              },
                        child: _isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text('Next'),
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

Future<void> _performReAuthAndChangeEmail(String password) async {
  try {
    // Step 1: Re-authenticate
    await ref
        .read(authNotifierProvider.notifier)
        .onReAuthenticate(widget.newEmail, password);

    // Step 2: Change email (will be handled by listener)
    await ref
        .read(authNotifierProvider.notifier)
        .onChangeEmail(widget.newEmail);
  } catch (e) {
    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('An unexpected error occurred')));
    }
  }
}
