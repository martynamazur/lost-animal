import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/link_account.dart';
import 'package:lostanimal/presentation/widget/menu_items_list.dart';
import 'package:lostanimal/presentation/widget/user_profile.dart';
import 'package:lostanimal/provider/auth_notifier.dart';

import '../model/menu_item_model.dart';
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

    final menuItems = [
      MenuItem(
        label: 'My reports',
        route: AddedReportsRoute(),
        icon: Icon(Icons.person_pin_circle_outlined),
      ),
      MenuItem(
        label: 'Settings',
        route: SettingsRoute(),
        icon: Icon(Icons.person_pin_circle_outlined),
      ),
    ];

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserProfile(),
                MenuItemsList(menuItems: menuItems),

                if(isAnonymous == true)
                  LinkAccount()
              ],
            ),
          ),
        )),
    );
  }
}
