import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/email_field.dart';
import 'package:lostanimal/presentation/widget/password_field.dart';
import 'package:lostanimal/provider/auth_notifier.dart';


import '../nawigation/app_router.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    ref.listen<AsyncValue<void>>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          //context.router.replace(HomeRoute());
        },
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(err.toString())),
          );
        },
      );
    });

    return Scaffold(
      body: SafeArea(
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 12,
                children: [
                  EmailField(),
                  PasswordField(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () => {
                            //context.router.push(SignUpRoute())
                          },
                          child: Text('Forgot your password ?')
                      ),
                    ],
                  ),
                  authState.isLoading ? const CircularProgressIndicator()
                  : ElevatedButton(onPressed:() async{
                    final messenger = ScaffoldMessenger.of(context);
                    if(_formKey.currentState?.saveAndValidate() ?? false){
                      final formData = _formKey.currentState!.value;
                      final email = formData['email'];
                      final password = formData['password'];
                      await authNotifier.login(email, password);

                    }else{
                      messenger.showSnackBar(SnackBar(content: Text('Wypelnij pola')));
                    }
                  }, child: Text('Sign in')),
                  
                ],
              ),
            )
          )
      ),
    );
  }
}
