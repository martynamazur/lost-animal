import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../../shared/widgets/dialog_confirmation.dart';
import '../provider/auth_notifier.dart';
import '../widgets/email_field.dart';

@RoutePage()
class ChangeEmailScreen extends ConsumerStatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  ConsumerState createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends ConsumerState<ChangeEmailScreen> {
  final _keyForm = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Listen to auth state changes
    ref.listenManual(authNotifierProvider, (previous, next) {
      if (!mounted) return;

      next.when(
        data: (_) {
          if (_isLoading) {
            _isLoading = false;
            _showEmailChangeSuccessDialog();
            context.router.pop();
          }
        },
        error: (error, _) {
          if (_isLoading) {
            _isLoading = false;
            final errorMessage = error.toString();

            if (errorMessage == 'requires-recent-login') {
              final newEmail = _keyForm.currentState?.value['email'];
              context.router.push(ReAuthPasswordRoute(newEmail: newEmail));
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(errorMessage)));
            }
          }
        },
        loading: () {
          // Loading state is handled by _isLoading flag
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    return Scaffold(
      appBar: AppBar(title: Text('Change email')),
      body: SafeArea(
        child: FormBuilder(
          key: _keyForm,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 16.0,
            ),
            child: Center(
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
                        EmailField(
                          icon: Icons.email_outlined,
                          label: userEmail ?? 'Current email',
                          enabled: false,
                        ),
                        EmailField(
                          label: 'New email',
                          icon: Icons.email_outlined,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: _isLoading
                                ? null
                                : () async {
                                    if (_keyForm.currentState
                                            ?.saveAndValidate() ??
                                        false) {
                                      setState(() => _isLoading = true);

                                      final newEmail =
                                          _keyForm.currentState?.value['email'];
                                      ref
                                          .read(authNotifierProvider.notifier)
                                          .onChangeEmail(newEmail);
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
                                : Text('Continue'),
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

  void _showEmailChangeSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return DialogConfirmation(
          title: 'Success',
          message: 'Your email has been changed successfully.',
          icon: Icons.email_outlined,
        );
      },
    );
  }
}
