import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'animal_category.dart';

part 'report_seen_model.freezed.dart';
part 'report_seen_model.g.dart';

@freezed
abstract class ReportSeen with _$ReportSeen {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ReportSeen({
    required String id,
    required List<String> pictures,
    String? phoneNumber,
    String? additionalInfo,
    required DateTime missingSince,
    @JsonKey(unknownEnumValue: AnimalCategory.unknown)required AnimalCategory category,
    String? type,
    String? userId,
    double? latitude,
    double? longitude,

  }) = _ReportSeen;



  factory ReportSeen.fromJson(Map<String, dynamic> json) =>
      _$ReportSeenFromJson(json);

  factory ReportSeen.empty() => ReportSeen(
      id: '',
      missingSince: DateTime.now().toUtc(),
      pictures: [],
      additionalInfo: '',
      phoneNumber: '',
      category: AnimalCategory.unknown,
      type: 'seen',
      userId: '',
      latitude: 0.0,
      longitude: 0.0
  );
}