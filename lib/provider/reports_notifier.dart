
import 'package:lostanimal/model/animal_category.dart';
import 'package:lostanimal/model/reports_state_model.dart';
import 'package:lostanimal/provider/report_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/report_model.dart';

part 'reports_notifier.g.dart';

@riverpod
class ReportsNotifier extends _$ReportsNotifier {

  AnimalCategory? get currentCategory => state.value?.categoryFilter;
  bool get currentToggle => state.value?.isAscending ?? true;


  @override
  FutureOr<ReportsState> build() async {
    final reports = await ref.watch(getAllReportsProvider.future);

    final sortedReports = [...reports]..sort((a, b) => b.missingSince.compareTo(a.missingSince));

    return ReportsState(
        reports: sortedReports,
        originalList: sortedReports,
        isAscending: true,
        categoryFilter: null
    );
  }

  void setCategory(AnimalCategory category){
    state = AsyncValue.data(
      state.value!.copyWith(
        categoryFilter: category,
      ),
    );
  }


  List<Report> filterByCategory(AnimalCategory category) {
    final current = state.value;
    if (current == null) return [];
    return current.reports.where((r) => r.category == category).toList();
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
      return current.copyWith(
        isAscending: !current.isAscending,
      );
    });
  }


}

