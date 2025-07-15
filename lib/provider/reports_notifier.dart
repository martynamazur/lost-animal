
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lostanimal/model/animal_category.dart';
import 'package:lostanimal/model/reports_state_model.dart';
import 'package:lostanimal/provider/report_missing_notifier.dart';
import 'package:lostanimal/provider/report_provider.dart';
import 'package:lostanimal/provider/report_seen_notifier.dart';
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


  List<Marker> getReportsMarks() {
    final current = state.value;
    if (current == null) return [];

    return current.reports.map((r) => Marker(
      markerId: MarkerId(r.id!),
      position: LatLng(r.latitude!, r.longitude!),
      infoWindow: InfoWindow(title: r.type, snippet: r.cityName ?? ''),
    )).toList();
  }

}

