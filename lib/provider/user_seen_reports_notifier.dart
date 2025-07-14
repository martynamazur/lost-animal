import 'dart:async';

import 'package:lostanimal/provider/report_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/report_seen_model.dart';

part 'user_seen_reports_notifier.g.dart';

@riverpod
class UserSeenReportsNotifier extends _$UserSeenReportsNotifier {

  @override
  FutureOr<List<ReportSeen>> build() async {
    final reports = await ref.read(getUserSeenReportsProvider.future);
    return reports;
  }
}
