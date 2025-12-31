import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lostanimal/features/auth/provider/auth_notifier.dart';

import '../../../core/router/app_router.dart';

class LinkAccount extends ConsumerWidget {
  const LinkAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 12,
        children: [
          Text(
            'Link your current account with a sign-in method below to keep your data safe and easily accessible across devices.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          FilledButton.icon(
            onPressed: () =>
                context.router.push(SignUpRoute(isLinkingAccount: true)),
            label: Row(
              spacing: 8.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: CupertinoColors.white, size: 16.0),
                Text(
                  'Link with email',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ],
            ),
          ),
          OutlinedButton.icon(
            onPressed: () async => authNotifier.onSignInGoogle(),
            label: Row(
              spacing: 8.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.google, size: 16.0),
                Text('Link with Google account'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
