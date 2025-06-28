import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              child: Column(
                spacing: 12,
                children: [
                  Text('Enter your email address and we’ll send you a link to reset your password.'),
                  EmailField(),
                  OutlinedButton(
                      onPressed: () async{
                        final messenger = ScaffoldMessenger.of(context);
                        if(_keyForm.currentState?.saveAndValidate() ?? false){
                          final email = _keyForm.currentState?.value['email'];
                          final result = await ref.read(resetPasswordProvider(emailAddress: email).future);
                          if(result.success){
                            _showConfirmationDialog(context);
                          }else{
                            messenger.showSnackBar(SnackBar(content: Text(result.errorMessage ?? 'Unknown error')));
                          }
                        }
                      },
                      child: Text('Reset')
                  )
                ],
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
        return AlertDialog(
          title: Text('Password Reset Email Sent'),
          content: Text('If an account with this email exists, you will receive an email with instructions to reset your password shortly.'),
          actions: [
            TextButton(
                onPressed: () => context.pop(),
                child: Text('OK')
            )
          ],
        );
      }
  );
}

