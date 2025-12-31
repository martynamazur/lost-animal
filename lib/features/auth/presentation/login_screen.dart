import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../../shared/widgets/divider_with_label.dart';
import '../provider/auth_notifier.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../widgets/social_auth_buttons.dart';

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
    ref.listen(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          context.router.replaceAll([DashboardRoute()]);
        },
        error: (err, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(err.toString())));
        },
      );
    });

    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16.0,
                children: [
                  LoginHeader(),
                  LoginForm(formKey: _formKey),
                  const DividerWithLabel(label: 'Or'),
                  SocialAuthButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
