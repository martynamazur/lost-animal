import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/model/auth_error_model.dart';
import 'package:lostanimal/nawigation/app_router.dart';
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
    return Scaffold(
      body: SafeArea(
          child: FormBuilder(
            key: _keyForm,
            child: Column(
              children: [
                EmailField(),
                OutlinedButton(onPressed: () async{
                  if(_keyForm.currentState?.saveAndValidate() ?? false){
                    final email = _keyForm.currentState?.value['email'];
                    final Result result = await ref.read(changeEmailProvider(newEmail: email).future);
                    if(result.success){
                      _showEmailChangeSuccessDialog();
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
                }, child: Text('Continue'))
              ],
            ),
          )
      ),
    );
  }
  void _showEmailChangeSuccessDialog(){
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your email has been changed successfully.'),
            actions: [
              TextButton(
                onPressed: () => context.router.pop(),
                child: Text('OK'),
              ),
            ],
          );
        }
    );
  }
}
