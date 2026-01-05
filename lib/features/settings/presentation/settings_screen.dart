import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/features/auth/provider/auth_notifier.dart';
import 'package:lostanimal/features/user/widgets/menu_items_list.dart';

import 'package:lostanimal/shared/models/menu_item_model.dart';

import '../../../core/router/app_router.dart';

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
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MenuItemsList(
            menuItems: menuItems,
            onSignOut: () async {
              await ref.read(authNotifierProvider.notifier).onSignOut();
              context.router.replaceAll([DashboardRoute()]);
            },
          ),
        ),
      ),
    );
  }
}
