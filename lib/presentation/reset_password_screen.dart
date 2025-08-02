import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/confirmation_dialog.dart';
import 'package:lostanimal/presentation/widget/dialog_confirmation.dart';
import 'package:lostanimal/presentation/widget/email_field.dart';
import 'package:lostanimal/provider/user_provider.dart';

@RoutePage()
class ResetPasswordScreen extends ConsumerWidget {
  ResetPasswordScreen({super.key});
  final _keyForm = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset password'),
      ),
      body: SafeArea(
          child: FormBuilder(
            key: _keyForm,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 12,
                  children: [
                    Text('Enter your email address and we’ll send you a link to reset your password.'),
                    EmailField(
                        label: 'Email'
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: () async{
                            final messenger = ScaffoldMessenger.of(context);
                            if(_keyForm.currentState?.saveAndValidate() ?? false){
                              final email = _keyForm.currentState?.value['email'];
                              final result = await ref.read(resetPasswordProvider(emailAddress: email).future);
                              if(result.success){
                                _showConfirmationDialog(context);
                                context.router.pop();
                              }else{
                                messenger.showSnackBar(SnackBar(content: Text(result.errorMessage ?? 'Unknown error')));
                              }
                            }
                          },
                          child: Text('Reset')
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );

    }
  }


void _showConfirmationDialog(BuildContext context){
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context){
        return DialogConfirmation(
            title: 'Check your email',
            message: 'If an account with this email exists, you will receive an email with instructions to reset your password shortly.',
            icon: Icons.email_outlined
        );
      }
  );
}

