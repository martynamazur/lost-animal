import 'package:lostanimal/shared/models/report_model.dart';

import 'animal_category.dart';

class ReportsState {
  final List<Report> reports;
  final List<Report> originalList;
  final bool isAscending;
  final AnimalCategory? categoryFilter;

  ReportsState({
    required this.reports,
    required this.originalList,
    this.isAscending = true,
    this.categoryFilter,
  });

  ReportsState copyWith({
    List<Report>? reports,
    List<Report>? originalList,
    bool? isAscending,
    AnimalCategory? categoryFilter,
  }) {
    return ReportsState(
      reports: reports ?? this.reports,
      originalList: originalList ?? this.originalList,
      isAscending: isAscending ?? this.isAscending,
      categoryFilter: categoryFilter ?? this.categoryFilter,
    );
  }
}
