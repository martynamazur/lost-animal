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
  const SignUpScreen({super.key});

  @override
  ConsumerState createState() => _SignOutScreenState();
}

class _SignOutScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormBuilderState>();


  
  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpFormNotifierProvider);
    final signUpNotifier = ref.read(signUpFormNotifierProvider.notifier);

    
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
                        onPressed: () async{
                          if(_formKey.currentState?.saveAndValidate() ?? false){
                            final formData = _formKey.currentState!.value;
                            final emailAddress = formData['email'];
                            final password = formData['password'];
                            await signUpNotifier.signUp(emailAddress, password);
                          }

                        },
                        child: Text('sign up'))

                  ],
                ),
              )
          )
      ),
    );
  }

  void _showConfirmationDialog(){
    showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text('Account created'),
            content: Text('Your account has been successfully created.We\’ve sent you a verification email with an activation link.Please check your inbox and follow the instructions to verify your email address.'),
            actions: [
              OutlinedButton(onPressed: () => context.pop(), child: Text('Ok'))
            ],
          );
        }
    );
  }
}
