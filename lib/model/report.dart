import 'animal_category.dart';

abstract class Report {
  String get type;
  List<String>? pictures;
  late AnimalCategory category;
  late DateTime missingSince;
  late bool hasChip;
  double? reward;
  String? cityName;

}

class ReportMissing implements Report {
  @override
  AnimalCategory category;

  @override
  bool hasChip;

  @override
  DateTime missingSince;

  @override
  List<String>? pictures;

  @override
  double? reward;

  @override
  String get type => 'missing';

  @override
  String? cityName;

  ReportMissing({
    required this.category,
    required this.hasChip,
    required this.missingSince,
    required this.pictures,
    this.reward,
    this.cityName
  });



}


class ReportSeen implements Report {
  @override
  AnimalCategory category;

  @override
  bool hasChip;

  @override
  DateTime missingSince;

  @override
  List<String>? pictures;

  @override
  double? reward;

  @override
  String get type => 'seen';

  @override
  String? cityName;

  ReportSeen({
    required this.category,
    required this.hasChip,
    required this.missingSince,
    required this.pictures,
    this.reward,
    this.cityName
  });


}

