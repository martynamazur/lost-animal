import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/router/app_router.dart';
import '../../../shared/widgets/dialog_confirmation.dart';
import '../../user/widgets/NameField.dart';
import '../provider/password_input_provider.dart';
import '../provider/sign_up_form_notifier.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/password_rules.dart';

@RoutePage()
class SignUpScreen extends ConsumerStatefulWidget {
  final bool isLinkingAccount;

  const SignUpScreen({super.key, this.isLinkingAccount = false});

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpFormNotifierProvider);

    ref.listen(signUpFormNotifierProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          _showConfirmationDialog();
          context.router.replaceAll([const AuthGateRoute()]);
        },
        error: (err, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(err.toString())));
        },
      );
    });
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16.0,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primaryContainer,
                          Theme.of(context).colorScheme.secondaryContainer,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.pets,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Join Our Community',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Help reunite lost pets with their families and connect with fellow animal lovers',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                                    .withOpacity(0.8),
                              ),
                        ),
                      ],
                    ),
                  ),

                  NameField(label: 'Your Name*'),
                  EmailField(label: 'Email'),
                  PasswordField(
                    onChanged: (value) {
                      ref
                          .read(passwordInputNotifierProvider.notifier)
                          .update(value!);
                    },
                  ),
                  PasswordRules(),
                  FormBuilderCheckbox(
                    name: 'accept_terms',
                    title: Text('Accept terms and conditions'),
                    validator: FormBuilderValidators.equal(
                      true,
                      errorText:
                          'You must accept terms and conditions to continue',
                    ),
                  ),
                  signUpState.isLoading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () => _onHandleSubmit(),
                            child: Text(
                              widget.isLinkingAccount
                                  ? 'Link account'
                                  : 'Sign up',
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHandleSubmit() async {
    final signUpNotifier = ref.read(signUpFormNotifierProvider.notifier);
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState!.value;
      final emailAddress = formData['email'];
      final password = formData['password'];
      final name = formData['name'];
      if (widget.isLinkingAccount) {
        await signUpNotifier.linkAnonymousAccount(
          emailAddress: emailAddress,
          password: password,
          name: name,
        );
      } else {
        await signUpNotifier.signUp(
          emailAddress: emailAddress,
          password: password,
          name: name,
        );
      }
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return DialogConfirmation(
          title: 'Account created',
          message: widget.isLinkingAccount
              ? 'Your anonymous account has been linked successfully.'
              : 'Your account has been successfully created. We’ve sent you a verification email...',
          icon: Icons.check_circle_outline,
        );
      },
    );
  }
}
