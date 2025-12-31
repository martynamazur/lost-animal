import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lostanimal/features/auth/provider/auth_notifier.dart';

class SocialAuthButtons extends ConsumerWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);

    return Column(
      children: [
        OutlinedButton(
          onPressed: () => authNotifier.onSignInAnon(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.0,
            children: [
              Icon(FontAwesomeIcons.user),
              Text('Continue without account'),
            ],
          ),
        ),

        OutlinedButton(
          onPressed: () => authNotifier.onSignInGoogle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8.0,
            children: [
              Icon(FontAwesomeIcons.google),
              Text('Continue with Google'),
            ],
          ),
        ),
      ],
    );
  }
}
