import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../nawigation/app_router.dart';
import '../../provider/auth_notifier.dart';

class LinkAccount extends ConsumerWidget {
  const LinkAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

