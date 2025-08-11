// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AboutAppScreen]
class AboutAppRoute extends PageRouteInfo<void> {
  const AboutAppRoute({List<PageRouteInfo>? children})
    : super(AboutAppRoute.name, initialChildren: children);

  static const String name = 'AboutAppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutAppScreen();
    },
  );
}

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
/// [AnimalCategoryPickerScreen]
class AnimalCategoryPickerRoute
    extends PageRouteInfo<AnimalCategoryPickerRouteArgs> {
  AnimalCategoryPickerRoute({
    Key? key,
    required void Function(AnimalCategory) onCategorySelected,
    List<PageRouteInfo>? children,
  }) : super(
         AnimalCategoryPickerRoute.name,
         args: AnimalCategoryPickerRouteArgs(
           key: key,
           onCategorySelected: onCategorySelected,
         ),
         initialChildren: children,
       );

  static const String name = 'AnimalCategoryPickerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnimalCategoryPickerRouteArgs>();
      return AnimalCategoryPickerScreen(
        key: args.key,
        onCategorySelected: args.onCategorySelected,
      );
    },
  );
}

class AnimalCategoryPickerRouteArgs {
  const AnimalCategoryPickerRouteArgs({
    this.key,
    required this.onCategorySelected,
  });

  final Key? key;

  final void Function(AnimalCategory) onCategorySelected;

  @override
  String toString() {
    return 'AnimalCategoryPickerRouteArgs{key: $key, onCategorySelected: $onCategorySelected}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AnimalCategoryPickerRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
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
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required String reportId,
    required String authorId,
    required String reportAuthorDisplayName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(
           reportId: reportId,
           authorId: authorId,
           reportAuthorDisplayName: reportAuthorDisplayName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return ChatScreen(
        args.reportId,
        args.authorId,
        args.reportAuthorDisplayName,
        key: args.key,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.reportId,
    required this.authorId,
    required this.reportAuthorDisplayName,
    this.key,
  });

  final String reportId;

  final String authorId;

  final String reportAuthorDisplayName;

  final Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{reportId: $reportId, authorId: $authorId, reportAuthorDisplayName: $reportAuthorDisplayName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return reportId == other.reportId &&
        authorId == other.authorId &&
        reportAuthorDisplayName == other.reportAuthorDisplayName &&
        key == other.key;
  }

  @override
  int get hashCode =>
      reportId.hashCode ^
      authorId.hashCode ^
      reportAuthorDisplayName.hashCode ^
      key.hashCode;
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
/// [FullscreenImageViewerScreen]
class FullscreenImageViewerRoute
    extends PageRouteInfo<FullscreenImageViewerRouteArgs> {
  FullscreenImageViewerRoute({
    Key? key,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
         FullscreenImageViewerRoute.name,
         args: FullscreenImageViewerRouteArgs(key: key, imageUrl: imageUrl),
         initialChildren: children,
       );

  static const String name = 'FullscreenImageViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FullscreenImageViewerRouteArgs>();
      return FullscreenImageViewerScreen(
        key: args.key,
        imageUrl: args.imageUrl,
      );
    },
  );
}

class FullscreenImageViewerRouteArgs {
  const FullscreenImageViewerRouteArgs({this.key, required this.imageUrl});

  final Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'FullscreenImageViewerRouteArgs{key: $key, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FullscreenImageViewerRouteArgs) return false;
    return key == other.key && imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => key.hashCode ^ imageUrl.hashCode;
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
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationsScreen();
    },
  );
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyPolicyScreen();
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
/// [ReportDetailsScreen]
class ReportDetailsRoute extends PageRouteInfo<ReportDetailsRouteArgs> {
  ReportDetailsRoute({
    required String reportId,
    required String reportAuthorDisplayName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ReportDetailsRoute.name,
         args: ReportDetailsRouteArgs(
           reportId: reportId,
           reportAuthorDisplayName: reportAuthorDisplayName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ReportDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportDetailsRouteArgs>();
      return ReportDetailsScreen(
        args.reportId,
        args.reportAuthorDisplayName,
        key: args.key,
      );
    },
  );
}

class ReportDetailsRouteArgs {
  const ReportDetailsRouteArgs({
    required this.reportId,
    required this.reportAuthorDisplayName,
    this.key,
  });

  final String reportId;

  final String reportAuthorDisplayName;

  final Key? key;

  @override
  String toString() {
    return 'ReportDetailsRouteArgs{reportId: $reportId, reportAuthorDisplayName: $reportAuthorDisplayName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReportDetailsRouteArgs) return false;
    return reportId == other.reportId &&
        reportAuthorDisplayName == other.reportAuthorDisplayName &&
        key == other.key;
  }

  @override
  int get hashCode =>
      reportId.hashCode ^ reportAuthorDisplayName.hashCode ^ key.hashCode;
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
/// [ReportSeenScreen]
class ReportSeenRoute extends PageRouteInfo<void> {
  const ReportSeenRoute({List<PageRouteInfo>? children})
    : super(ReportSeenRoute.name, initialChildren: children);

  static const String name = 'ReportSeenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportSeenScreen();
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
