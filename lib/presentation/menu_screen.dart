import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/provider/auth_notifier.dart';

import '../nawigation/app_router.dart';

@RoutePage()
class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  bool get isAnonymous => FirebaseAuth.instance.currentUser?.isAnonymous ?? false;

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 12.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () => context.pushRoute(SettingsRoute()),
                    child: Text('Settings')
                ),
                if(isAnonymous == true)
                  _linkAccount()
              ],
            ),
          ),
        )),
    );
  }

  Widget _linkAccount(){
    final authNotifier = ref.read(authNotifierProvider.notifier);
    return Column(
      spacing: 12,
      children: [
        Text('Link your current account with a sign-in method below to keep your data safe and easily accessible across devices.'),
        OutlinedButton(
            onPressed: () => context.router.push(SignUpRoute(isLinkingAccount: true)),
            child: Text('Link with email')
        ),
        OutlinedButton(
            onPressed: () async => authNotifier.onSignInGoogle(),
            child: Text('Link google account')
        )
      ],
    );
  }
}
