
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:lostanimal/nawigation/auth_guard.dart';
import 'package:lostanimal/presentation/dashboard_screen.dart';
import 'package:lostanimal/presentation/inbox_screen.dart';
import 'package:lostanimal/presentation/widget/change_password.dart';
import 'package:lostanimal/presentation/widget/report_details_screen.dart';

import '../model/animal_category.dart';
import '../model/chat_model.dart';
import '../presentation/about_app_screen.dart';
import '../presentation/added_reports_screen.dart';
import '../presentation/category_picker_screen.dart';
import '../presentation/change_email_screen.dart';
import '../presentation/chat_screen.dart';
import '../presentation/full_screen_image_viewer.dart';
import '../presentation/home_screen.dart';
import '../presentation/login_screen.dart';
import '../presentation/menu_screen.dart';
import '../presentation/notifications_screen.dart';
import '../presentation/privacy_policy_screen.dart';
import '../presentation/reauth_password_screen.dart';
import '../presentation/report_missing_form_screen.dart';
import '../presentation/report_screen.dart';
import '../presentation/report_seen_from_screen.dart';
import '../presentation/reset_password_screen.dart';
import '../presentation/settings_screen.dart';
import '../presentation/sign_up_screen.dart';
import 'package:collection/collection.dart';


part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final authGuard = AuthGuard();

  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: DashboardRoute.page,
      initial: true,
      guards: [authGuard],
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ReportRoute.page),
        AutoRoute(page: InboxRoute.page),
        AutoRoute(page: MenuRoute.page)
    ]),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: ChangeEmailRoute.page),
    AutoRoute(
        page: ReAuthPasswordRoute.page,
        path: '/reAuthPassword/:newEmail'
    ),

    AutoRoute(page: ReportMissingFormRoute.page),
    AutoRoute(page: ReportSeenRoute.page),
    AutoRoute(page: AddedReportsRoute.page),
    AutoRoute(page: AnimalCategoryPickerRoute.page),
    AutoRoute(page: AboutAppRoute.page),
    AutoRoute(page: PrivacyPolicyRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: ReportDetailsRoute.page),
    AutoRoute(page: FullscreenImageViewerRoute.page),
    AutoRoute(page: ChatRoute.page)
    
  
    
  ];

  @override
  List<AutoRouteGuard> get guards => [
  ];
}