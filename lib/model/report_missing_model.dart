import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lostanimal/model/animal_category.dart';

import 'gender.dart';

part 'report_missing_model.freezed.dart';

part 'report_missing_model.g.dart';

@freezed
abstract class ReportMissing with _$ReportMissing {
  const factory ReportMissing({
    required String id,
    required List<String> pictures,
    @JsonKey(unknownEnumValue: AnimalCategory.unknown)required AnimalCategory category,
    String? breed,
    @JsonKey(unknownEnumValue: Gender.unknown) required Gender gender,
    required bool hasChip,
    String? coloration,
    required DateTime missingSince,
    double? reward,
    String? additionalInfo,
    String? phoneNumber,
    String? type,
    String? userId,

    double? latitude,
    double? longitude,
    String? cityName

  }) = _ReportMissing;

  factory ReportMissing.fromJson(Map<String, dynamic> json) =>
      _$ReportMissingFromJson(json);

  factory ReportMissing.empty() => ReportMissing(
      id: '',
      pictures: [],
      category: AnimalCategory.unknown,
      gender: Gender.unknown,
      hasChip: false,
      missingSince: DateTime.now().toUtc(),
      coloration: '',
      reward: 0.0,
      additionalInfo: '',
      breed: '',
      phoneNumber: '',
      type: 'missing',
      userId: '',
      latitude: 0.0,
      longitude: 0.0,
      cityName: ''
  );
}
