import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/model/auth_error_model.dart';
import 'package:lostanimal/nawigation/app_router.dart';
import 'package:lostanimal/presentation/widget/dialog_confirmation.dart';
import 'package:lostanimal/presentation/widget/email_field.dart';
import 'package:lostanimal/provider/user_provider.dart';

import '../model/result_model.dart';

@RoutePage()
class ChangeEmailScreen extends ConsumerStatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  ConsumerState createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends ConsumerState<ChangeEmailScreen> {
  final _keyForm = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change email'),
      ),
      body: SafeArea(
          child: FormBuilder(
            key: _keyForm,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:  15.0, horizontal: 16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
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
                            child: FilledButton(onPressed: () async{
                              if(_keyForm.currentState?.saveAndValidate() ?? false){
                                final email = _keyForm.currentState?.value['email'];
                                final Result result = await ref.read(changeEmailProvider(newEmail: email).future);
                                if(result.success){
                                  _showEmailChangeSuccessDialog();
                                  context.router.pop();
                                }else{
                                  switch(result.code){
                                    case AuthError.requiresRecentLogin:
                                      context.router.push(ReAuthPasswordRoute(newEmail: email));
                                      break;

                                    default:
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(result.errorMessage ?? 'Error'),
                                        )
                                      );
                                  }
                                }
                              }
                            }, child: Text('Continue')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
  void _showEmailChangeSuccessDialog(){
    showDialog(
        context: context,
        builder: (_) {
          return DialogConfirmation(
              title: 'Success',
              message: 'Your email has been changed successfully.',
              icon: Icons.email_outlined
          );
        }
    );
  }
}
