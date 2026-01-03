import 'package:lostanimal/shared/models/report_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../provider/report_provider.dart';

part 'report_details_notifier.g.dart';

@riverpod
class ReportDetailsNotifier extends _$ReportDetailsNotifier {
  @override
  Future<Report?> build(String reportId) async {
    final report = await ref.watch(
      getReportByIdProvider(reportId: reportId).future,
    );
    if (report == null) {
      throw Exception('Report not found');
    }
    return report;
  }
}
