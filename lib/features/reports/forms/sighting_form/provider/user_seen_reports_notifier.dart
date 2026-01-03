import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lostanimal/shared/models/report_model.dart';

import '../../../provider/report_provider.dart';

part 'user_seen_reports_notifier.g.dart';

@riverpod
class UserSeenReportsNotifier extends _$UserSeenReportsNotifier {
  @override
  FutureOr<List<Report>> build() async {
    final reports = await ref.read(getUserSeenReportsProvider.future);
    return reports;
  }
}
