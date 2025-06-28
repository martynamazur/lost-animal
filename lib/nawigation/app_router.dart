
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:lostanimal/presentation/dashboard_screen.dart';

import '../presentation/auth_gate_screen.dart';
import '../presentation/change_email_screen.dart';
import '../presentation/home_screen.dart';
import '../presentation/login_screen.dart';
import '../presentation/menu_screen.dart';
import '../presentation/reauth_password_screen.dart';
import '../presentation/reset_password_screen.dart';
import '../presentation/settings_screen.dart';
import '../presentation/sign_up_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: AuthGateRoute.page,initial: true),
    AutoRoute(page: LoginRoute.page, ),
    AutoRoute(page: SignUpRoute.page, ),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: DashboardRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: MenuRoute.page)
    ]),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: ChangeEmailRoute.page),
    AutoRoute(
        page: ReAuthPasswordRoute.page,
        path: '/reAuthPassword/:newEmail'
    )
  ];


  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}