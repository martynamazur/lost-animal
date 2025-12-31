import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../../shared/models/menu_item_model.dart';
import '../../auth/provider/auth_notifier.dart';
import '../../auth/widgets/link_account.dart';
import '../../user/widgets/menu_items_list.dart';
import '../../user/widgets/user_profile.dart';

@RoutePage()
class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  bool get isAnonymous =>
      FirebaseAuth.instance.currentUser?.isAnonymous ?? false;

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItem(
        label: 'My reports',
        route: AddedReportsRoute(),
        icon: Icon(Icons.person_pin_circle_outlined),
      ),
      MenuItem(
        label: 'Settings',
        route: SettingsRoute(),
        icon: Icon(Icons.settings),
      ),
    ];

    ref.listen<AsyncValue<void>>(authNotifierProvider, (previous, next) {
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
      /*
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.router.push(SettingsRoute()),
              icon: Icon(Icons.settings)
          )
        ],
      ),
      */
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                spacing: 16.0,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserProfile(),
                  MenuItemsList(menuItems: menuItems),
                  if (isAnonymous == true) LinkAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
