import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lostanimal/model/animal_category.dart';

import 'gender.dart';

part 'report_model.freezed.dart';

part 'report_model.g.dart';

@freezed
abstract class Report with _$Report {
  const factory Report({
    String? id,
    required DateTime missingSince,
    required String type,

    @Default(AnimalCategory.unknown)
    @JsonKey(unknownEnumValue: AnimalCategory.unknown) AnimalCategory category,

    @Default(Gender.unknown)
    @JsonKey(unknownEnumValue: Gender.unknown) Gender gender,
    
    @Default([]) List<String> pictures,
    bool? hasChip,
    String? coloration,
    String? breed,
    double? reward,
    String? additionalInfo,
    String? phoneNumber,
    String? userId,
    double? latitude,
    double? longitude,
    String? cityName

  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) =>
      _$ReportFromJson(json);

  factory Report.empty() => Report(
      id: '',
      pictures: [],
      category: AnimalCategory.unknown,
      gender: Gender.unknown,
      missingSince: DateTime.now().toUtc(),
      coloration: '',
      reward: 0.0,
      additionalInfo: '',
      breed: '',
      phoneNumber: '',
      type: '',
      userId: '',
      latitude: 0.0,
      longitude: 0.0,
      cityName: '',
      hasChip: false
  );
}
