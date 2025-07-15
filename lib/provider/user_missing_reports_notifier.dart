import 'dart:async';

import 'package:lostanimal/model/report_model.dart';
import 'package:lostanimal/provider/report_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_missing_reports_notifier.g.dart';

@riverpod
class UserMissingReportsNotifier extends _$UserMissingReportsNotifier {
  @override
  FutureOr<List<Report>> build() async {
    final reports = await ref.read(getUserMissingReportsProvider.future);
    return reports;
  }
  
}
