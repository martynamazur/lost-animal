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
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: 'Add missing', icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: 'Menu',icon: Icon(Icons.menu)),
            ],
          ),
        );
      },
    );
  }
}