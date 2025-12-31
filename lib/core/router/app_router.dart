import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:collection/collection.dart';

import '../../features/auth/presentation/change_email_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/reauth_password_screen.dart';
import '../../features/auth/presentation/reset_password_screen.dart';
import '../../features/auth/presentation/sign_up_screen.dart';
import '../../features/auth/presentation/auth_gate_screen.dart';
import '../../features/auth/widgets/change_password.dart';
import '../../features/chat/presentation/chat_screen.dart';
import '../../features/home/dashboard_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/inbox/presentation/inbox_screen.dart';
import '../../features/reports/presentation/added_reports_screen.dart';
import '../../features/reports/presentation/category_picker_screen.dart';
import '../../features/reports/presentation/report_missing_form_screen.dart';
import '../../features/reports/presentation/report_screen.dart';
import '../../features/reports/presentation/report_seen_from_screen.dart';
import '../../features/reports/widgets/report_details_screen.dart';
import '../../features/settings/presentation/privacy_policy_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/settings/presentation/about_app_screen.dart';
import '../../features/settings/presentation/notifications_screen.dart';
import '../../features/menu/presentation/menu_screen.dart';
import '../../shared/models/animal_category.dart';
import '../components/full_screen_image_viewer.dart';
import 'auth_guard.dart';

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
    AutoRoute(
      page: DashboardRoute.page,
      initial: true,
      guards: [authGuard],
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ReportRoute.page),
        AutoRoute(page: InboxRoute.page),
        AutoRoute(page: MenuRoute.page),
      ],
    ),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: ChangeEmailRoute.page),
    AutoRoute(
      page: ReAuthPasswordRoute.page,
      path: '/reAuthPassword/:newEmail',
    ),
    AutoRoute(page: ReportMissingFormRoute.page),
    AutoRoute(page: ReportSeenRoute.page),
    AutoRoute(page: AddedReportsRoute.page),
    AutoRoute(page: AnimalCategoryPickerRoute.page),
    AutoRoute(page: PrivacyPolicyRoute.page),
    AutoRoute(page: AboutAppRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(page: ReportDetailsRoute.page),
    AutoRoute(page: FullscreenImageViewerRoute.page),
    AutoRoute(page: ChatRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: InboxRoute.page),
    AutoRoute(page: MenuRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
