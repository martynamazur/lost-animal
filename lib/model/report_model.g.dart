// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Report _$ReportFromJson(Map<String, dynamic> json) => _Report(
  id: json['id'] as String?,
  missingSince: DateTime.parse(json['missingSince'] as String),
  type: json['type'] as String,
  category:
      $enumDecodeNullable(
        _$AnimalCategoryEnumMap,
        json['category'],
        unknownValue: AnimalCategory.unknown,
      ) ??
      AnimalCategory.unknown,
  gender:
      $enumDecodeNullable(
        _$GenderEnumMap,
        json['gender'],
        unknownValue: Gender.unknown,
      ) ??
      Gender.unknown,
  pictures:
      (json['pictures'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  hasChip: json['hasChip'] as bool?,
  coloration: json['coloration'] as String?,
  breed: json['breed'] as String?,
  reward: (json['reward'] as num?)?.toDouble(),
  additionalInfo: json['additionalInfo'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  cityName: json['cityName'] as String?,
  reportAuthorDisplayName: json['reportAuthorDisplayName'] as String,
  userId: json['userId'] as String,
);

Map<String, dynamic> _$ReportToJson(_Report instance) => <String, dynamic>{
  'id': instance.id,
  'missingSince': instance.missingSince.toIso8601String(),
  'type': instance.type,
  'category': _$AnimalCategoryEnumMap[instance.category]!,
  'gender': _$GenderEnumMap[instance.gender]!,
  'pictures': instance.pictures,
  'hasChip': instance.hasChip,
  'coloration': instance.coloration,
  'breed': instance.breed,
  'reward': instance.reward,
  'additionalInfo': instance.additionalInfo,
  'phoneNumber': instance.phoneNumber,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'cityName': instance.cityName,
  'reportAuthorDisplayName': instance.reportAuthorDisplayName,
  'userId': instance.userId,
};

const _$AnimalCategoryEnumMap = {
  AnimalCategory.unknown: 'unknown',
  AnimalCategory.dog: 'dog',
  AnimalCategory.cat: 'cat',
  AnimalCategory.bird: 'bird',
  AnimalCategory.rabbit: 'rabbit',
  AnimalCategory.reptile: 'reptile',
  AnimalCategory.horse: 'horse',
  AnimalCategory.other: 'other',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};
