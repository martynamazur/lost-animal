import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostanimal/nawigation/app_router.dart';
import 'package:lostanimal/presentation/login_screen.dart';

import '../nawigation/app_router.dart';
import 'home_screen.dart';

@RoutePage()
class AuthGateScreen extends StatefulWidget {
  const AuthGateScreen({super.key});

  @override
  State<AuthGateScreen> createState() => _AuthGateScreenState();
}

class _AuthGateScreenState extends State<AuthGateScreen> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().first.then((user) {
      if (!mounted) return;

      AutoRouter.of(context);
      if (user != null) {
        context.router.replace(const DashboardRoute());
      } else {
        context.router.replace(const LoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Możesz tu dać SplashScreen albo pusty Scaffold na chwilę
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
