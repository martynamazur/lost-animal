import 'dart:async';

import 'package:lostanimal/shared/models/report_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../provider/report_provider.dart';

part 'user_missing_reports_notifier.g.dart';

@riverpod
class UserMissingReportsNotifier extends _$UserMissingReportsNotifier {
  @override
  FutureOr<List<Report>> build() async {
    final reports = await ref.read(getUserMissingReportsProvider.future);
    return reports;
  }
}
