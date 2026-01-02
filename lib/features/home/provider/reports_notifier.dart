import 'package:lostanimal/shared/models/animal_category.dart';
import 'package:lostanimal/shared/models/reports_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lostanimal/shared/models/report_model.dart';

import '../../reports/shared/provider/report_provider.dart';

part 'reports_notifier.g.dart';

@riverpod
class ReportsNotifier extends _$ReportsNotifier {
  AnimalCategory? get currentCategory => state.value?.categoryFilter;
  bool get currentToggle => state.value?.isAscending ?? true;

  @override
  FutureOr<ReportsState> build() async {
    final reports = await ref.watch(getAllReportsProvider.future);

    final sortedReports = [...reports]
      ..sort((a, b) => b.missingSince.compareTo(a.missingSince));

    return ReportsState(
      reports: sortedReports,
      originalList: sortedReports,
      isAscending: false,
      categoryFilter: null,
    );
  }

  void filterByCategory(AnimalCategory category) {
    state = AsyncData(
      state.value!.copyWith(
        categoryFilter: category,
        reports: state.value!.originalList
            .where((r) => r.category == category)
            .toList(),
      ),
    );
  }

  void clearFilters() async {
    update((current) {
      return current.copyWith(
        reports: current.originalList,
        categoryFilter: null,
      );
    });
  }

  void toggleSortOrder() {
    update((current) {
      final sortedReports = [...current.reports];

      sortedReports.sort(
        (a, b) => current.isAscending
            ? b.missingSince.compareTo(a.missingSince)
            : a.missingSince.compareTo(b.missingSince),
      );

      return current.copyWith(
        reports: sortedReports,
        isAscending: !current.isAscending,
      );
    });
  }
}
