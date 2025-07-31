// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddedReportsScreen]
class AddedReportsRoute extends PageRouteInfo<void> {
  const AddedReportsRoute({List<PageRouteInfo>? children})
    : super(AddedReportsRoute.name, initialChildren: children);

  static const String name = 'AddedReportsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddedReportsScreen();
    },
  );
}

/// generated route for
/// [ChangeEmailScreen]
class ChangeEmailRoute extends PageRouteInfo<void> {
  const ChangeEmailRoute({List<PageRouteInfo>? children})
    : super(ChangeEmailRoute.name, initialChildren: children);

  static const String name = 'ChangeEmailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangeEmailScreen();
    },
  );
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [InboxScreen]
class InboxRoute extends PageRouteInfo<void> {
  const InboxRoute({List<PageRouteInfo>? children})
    : super(InboxRoute.name, initialChildren: children);

  static const String name = 'InboxRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InboxScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
    : super(MenuRoute.name, initialChildren: children);

  static const String name = 'MenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MenuScreen();
    },
  );
}

/// generated route for
/// [ReAuthPasswordScreen]
class ReAuthPasswordRoute extends PageRouteInfo<ReAuthPasswordRouteArgs> {
  ReAuthPasswordRoute({
    required String newEmail,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ReAuthPasswordRoute.name,
         args: ReAuthPasswordRouteArgs(newEmail: newEmail, key: key),
         initialChildren: children,
       );

  static const String name = 'ReAuthPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReAuthPasswordRouteArgs>();
      return ReAuthPasswordScreen(args.newEmail, key: args.key);
    },
  );
}

class ReAuthPasswordRouteArgs {
  const ReAuthPasswordRouteArgs({required this.newEmail, this.key});

  final String newEmail;

  final Key? key;

  @override
  String toString() {
    return 'ReAuthPasswordRouteArgs{newEmail: $newEmail, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReAuthPasswordRouteArgs) return false;
    return newEmail == other.newEmail && key == other.key;
  }

  @override
  int get hashCode => newEmail.hashCode ^ key.hashCode;
}

/// generated route for
/// [ReportMissingFormScreen]
class ReportMissingFormRoute extends PageRouteInfo<void> {
  const ReportMissingFormRoute({List<PageRouteInfo>? children})
    : super(ReportMissingFormRoute.name, initialChildren: children);

  static const String name = 'ReportMissingFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportMissingFormScreen();
    },
  );
}

/// generated route for
/// [ReportScreen]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute({List<PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportScreen();
    },
  );
}

/// generated route for
/// [ReportSeenFromScreen]
class ReportSeenFromRoute extends PageRouteInfo<void> {
  const ReportSeenFromRoute({List<PageRouteInfo>? children})
    : super(ReportSeenFromRoute.name, initialChildren: children);

  static const String name = 'ReportSeenFromRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportSeenFromScreen();
    },
  );
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        ResetPasswordRoute.name,
        args: ResetPasswordRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>(
        orElse: () => const ResetPasswordRouteArgs(),
      );
      return ResetPasswordScreen(key: args.key);
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    bool isLinkingAccount = false,
    List<PageRouteInfo>? children,
  }) : super(
         SignUpRoute.name,
         args: SignUpRouteArgs(key: key, isLinkingAccount: isLinkingAccount),
         initialChildren: children,
       );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>(
        orElse: () => const SignUpRouteArgs(),
      );
      return SignUpScreen(
        key: args.key,
        isLinkingAccount: args.isLinkingAccount,
      );
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key, this.isLinkingAccount = false});

  final Key? key;

  final bool isLinkingAccount;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, isLinkingAccount: $isLinkingAccount}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignUpRouteArgs) return false;
    return key == other.key && isLinkingAccount == other.isLinkingAccount;
  }

  @override
  int get hashCode => key.hashCode ^ isLinkingAccount.hashCode;
}
