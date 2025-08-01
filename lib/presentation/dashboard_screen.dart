import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../nawigation/app_router.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ReportRoute(),
        InboxRoute(),
        MenuRoute()
      ],
      transitionBuilder: (context,child,animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => tabsRouter.setActiveIndex(index),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: 'Create', icon: Icon(Icons.add)),
                BottomNavigationBarItem(label: 'Inbox', icon: Icon(Icons.inbox)),
                BottomNavigationBarItem(label: 'Menu', icon: Icon(Icons.menu)),
              ],
            ),

        );
      },
    );
  }
}