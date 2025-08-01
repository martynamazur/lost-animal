import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lostanimal/presentation/home_screen.dart';
import 'package:lostanimal/presentation/widget/divider_with_label.dart';
import 'package:lostanimal/presentation/widget/email_field.dart';
import 'package:lostanimal/presentation/widget/login_form.dart';
import 'package:lostanimal/presentation/widget/login_header.dart';
import 'package:lostanimal/presentation/widget/password_field.dart';
import 'package:lostanimal/presentation/widget/social_auth_buttons.dart';
import 'package:lostanimal/provider/auth_notifier.dart';
import 'package:lostanimal/provider/user_provider.dart';
import 'package:lostanimal/service/google_auth_service.dart';


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

    ref.listen<AsyncValue<void>>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          context.router.replaceAll([DashboardRoute()]);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 12,
                children: [
                  LoginHeader(),
                  LoginForm(formKey: _formKey),
                  const DividerWithLabel(label: 'Or'),
                  SocialAuthButtons()
                ],
              ),
            )
          )
      ),
    );
  }
}
