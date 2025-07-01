import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lostanimal/presentation/widget/email_field.dart';
import 'package:lostanimal/presentation/widget/password_field.dart';

import '../provider/sign_up_form_notifier.dart';

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
  void initState() {
    super.initState();
    ref.listen(signUpFormNotifierProvider, (prev, next) {
      next.whenOrNull(
          data:  (_){
            _showConfirmationDialog();
          },
          error: (err,stack){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(err.toString()))
            );
          }
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpFormNotifierProvider);

    return Scaffold(
      body: SafeArea(
          child: FormBuilder(
            key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    EmailField(),
                    PasswordField(),
                    FormBuilderCheckbox(
                        name: 'accept_terms',
                        title: Text('Accept terms and conditions'),
                        validator: FormBuilderValidators.equal(
                          true,
                          errorText: 'You must accept terms and conditions to continue'
                        ),
                    ),
                    signUpState.isLoading ? CircularProgressIndicator() 
                      :OutlinedButton(
                        onPressed: () => _onHandleSubmit(),
                        child: Text(widget.isLinkingAccount ? 'Link account' : 'sign up'))

                  ],
                ),
              )
          )
      ),
    );
  }

  void _onHandleSubmit() async{
    final signUpNotifier = ref.read(signUpFormNotifierProvider.notifier);
    if(_formKey.currentState?.saveAndValidate() ?? false){
      final formData = _formKey.currentState!.value;
      final emailAddress = formData['email'];
      final password = formData['password'];
      if(widget.isLinkingAccount){
        await signUpNotifier.linkAnonymousAccount(emailAddress:emailAddress,password:password);
      }else{
        await signUpNotifier.signUp(emailAddress:emailAddress,password: password);
      }
    }
  }

  void _showConfirmationDialog(){
    showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text('Account created'),
            content: Text(
                widget.isLinkingAccount
                    ? 'Your anonymous account has been linked successfully.'
                    : 'Your account has been successfully created. We’ve sent you a verification email...'
            ),
            actions: [
              OutlinedButton(onPressed: () => context.pop(), child: Text('Ok'))
            ],
          );
        }
    );
  }
}
