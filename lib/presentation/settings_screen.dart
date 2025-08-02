import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/change_email_screen.dart';
import 'package:lostanimal/presentation/widget/menu_items_list.dart';
import 'package:lostanimal/provider/user_provider.dart';

import '../model/menu_item_model.dart';
import '../model/result_model.dart';
import '../nawigation/app_router.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItems = [
      MenuItem(
        label: 'Change email address',
        route: ChangeEmailRoute(),
        icon: Icon(Icons.email_outlined),
      ),
      MenuItem(
        label: 'Change password',
        route: ChangePasswordRoute(),
        icon: Icon(Icons.lock_outline),
      ),
      MenuItem(
        label: 'About app',
        route: AboutAppRoute(),
        icon: Icon(Icons.phone_android),
      ),
      MenuItem(
        label: 'Privacy & Security',
        route: PrivacyPolicyRoute(),
        icon: Icon(Icons.privacy_tip_outlined),
      ),
      MenuItem(
        label: 'Notifications',
        route: NotificationsRoute(),
        icon: Icon(Icons.notifications_active_outlined),
      ),
      MenuItem(
        label: 'Sign out',
        route: null,
        icon: Icon(Icons.logout_outlined),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 12,
              children: [
                MenuItemsList(
                  menuItems: menuItems,
                  onSignOut: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    ref.read(signOutProvider.future).then((result) {
                      if (result.success) {
                        context.router.replaceAll([LoginRoute()]);
                      } else {
                        messenger.showSnackBar(
                            SnackBar(
                                content: Text(result.errorMessage ??
                                'Ups something went wrong. Try again')
                            ));
                      }
                    });
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}