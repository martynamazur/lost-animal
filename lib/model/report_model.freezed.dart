// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Report implements DiagnosticableTreeMixin {

 String? get id; DateTime get missingSince; String get type;@JsonKey(unknownEnumValue: AnimalCategory.unknown) AnimalCategory get category;@JsonKey(unknownEnumValue: Gender.unknown) Gender get gender; List<String> get pictures; bool? get hasChip; String? get coloration; String? get breed; double? get reward; String? get additionalInfo; String? get phoneNumber; String? get userId; double? get latitude; double? get longitude; String? get cityName;
/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportCopyWith<Report> get copyWith => _$ReportCopyWithImpl<Report>(this as Report, _$identity);

  /// Serializes this Report to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Report'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('missingSince', missingSince))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('gender', gender))..add(DiagnosticsProperty('pictures', pictures))..add(DiagnosticsProperty('hasChip', hasChip))..add(DiagnosticsProperty('coloration', coloration))..add(DiagnosticsProperty('breed', breed))..add(DiagnosticsProperty('reward', reward))..add(DiagnosticsProperty('additionalInfo', additionalInfo))..add(DiagnosticsProperty('phoneNumber', phoneNumber))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('cityName', cityName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Report&&(identical(other.id, id) || other.id == id)&&(identical(other.missingSince, missingSince) || other.missingSince == missingSince)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.pictures, pictures)&&(identical(other.hasChip, hasChip) || other.hasChip == hasChip)&&(identical(other.coloration, coloration) || other.coloration == coloration)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.cityName, cityName) || other.cityName == cityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,missingSince,type,category,gender,const DeepCollectionEquality().hash(pictures),hasChip,coloration,breed,reward,additionalInfo,phoneNumber,userId,latitude,longitude,cityName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Report(id: $id, missingSince: $missingSince, type: $type, category: $category, gender: $gender, pictures: $pictures, hasChip: $hasChip, coloration: $coloration, breed: $breed, reward: $reward, additionalInfo: $additionalInfo, phoneNumber: $phoneNumber, userId: $userId, latitude: $latitude, longitude: $longitude, cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class $ReportCopyWith<$Res>  {
  factory $ReportCopyWith(Report value, $Res Function(Report) _then) = _$ReportCopyWithImpl;
@useResult
$Res call({
 String? id, DateTime missingSince, String type,@JsonKey(unknownEnumValue: AnimalCategory.unknown) AnimalCategory category,@JsonKey(unknownEnumValue: Gender.unknown) Gender gender, List<String> pictures, bool? hasChip, String? coloration, String? breed, double? reward, String? additionalInfo, String? phoneNumber, String? userId, double? latitude, double? longitude, String? cityName
});




}
/// @nodoc
class _$ReportCopyWithImpl<$Res>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._self, this._then);

  final Report _self;
  final $Res Function(Report) _then;

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? missingSince = null,Object? type = null,Object? category = null,Object? gender = null,Object? pictures = null,Object? hasChip = freezed,Object? coloration = freezed,Object? breed = freezed,Object? reward = freezed,Object? additionalInfo = freezed,Object? phoneNumber = freezed,Object? userId = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? cityName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,missingSince: null == missingSince ? _self.missingSince : missingSince // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AnimalCategory,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,pictures: null == pictures ? _self.pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>,hasChip: freezed == hasChip ? _self.hasChip : hasChip // ignore: cast_nullable_to_non_nullable
as bool?,coloration: freezed == coloration ? _self.coloration : coloration // ignore: cast_nullable_to_non_nullable
as String?,breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as double?,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Report with DiagnosticableTreeMixin implements Report {
  const _Report({this.id, required this.missingSince, required this.type, @JsonKey(unknownEnumValue: AnimalCategory.unknown) this.category = AnimalCategory.unknown, @JsonKey(unknownEnumValue: Gender.unknown) this.gender = Gender.unknown, final  List<String> pictures = const [], this.hasChip, this.coloration, this.breed, this.reward, this.additionalInfo, this.phoneNumber, this.userId, this.latitude, this.longitude, this.cityName}): _pictures = pictures;
  factory _Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

@override final  String? id;
@override final  DateTime missingSince;
@override final  String type;
@override@JsonKey(unknownEnumValue: AnimalCategory.unknown) final  AnimalCategory category;
@override@JsonKey(unknownEnumValue: Gender.unknown) final  Gender gender;
 final  List<String> _pictures;
@override@JsonKey() List<String> get pictures {
  if (_pictures is EqualUnmodifiableListView) return _pictures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pictures);
}

@override final  bool? hasChip;
@override final  String? coloration;
@override final  String? breed;
@override final  double? reward;
@override final  String? additionalInfo;
@override final  String? phoneNumber;
@override final  String? userId;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? cityName;

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCopyWith<_Report> get copyWith => __$ReportCopyWithImpl<_Report>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Report'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('missingSince', missingSince))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('gender', gender))..add(DiagnosticsProperty('pictures', pictures))..add(DiagnosticsProperty('hasChip', hasChip))..add(DiagnosticsProperty('coloration', coloration))..add(DiagnosticsProperty('breed', breed))..add(DiagnosticsProperty('reward', reward))..add(DiagnosticsProperty('additionalInfo', additionalInfo))..add(DiagnosticsProperty('phoneNumber', phoneNumber))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('latitude', latitude))..add(DiagnosticsProperty('longitude', longitude))..add(DiagnosticsProperty('cityName', cityName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Report&&(identical(other.id, id) || other.id == id)&&(identical(other.missingSince, missingSince) || other.missingSince == missingSince)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other._pictures, _pictures)&&(identical(other.hasChip, hasChip) || other.hasChip == hasChip)&&(identical(other.coloration, coloration) || other.coloration == coloration)&&(identical(other.breed, breed) || other.breed == breed)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.additionalInfo, additionalInfo) || other.additionalInfo == additionalInfo)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.cityName, cityName) || other.cityName == cityName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,missingSince,type,category,gender,const DeepCollectionEquality().hash(_pictures),hasChip,coloration,breed,reward,additionalInfo,phoneNumber,userId,latitude,longitude,cityName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Report(id: $id, missingSince: $missingSince, type: $type, category: $category, gender: $gender, pictures: $pictures, hasChip: $hasChip, coloration: $coloration, breed: $breed, reward: $reward, additionalInfo: $additionalInfo, phoneNumber: $phoneNumber, userId: $userId, latitude: $latitude, longitude: $longitude, cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class _$ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) _then) = __$ReportCopyWithImpl;
@override @useResult
$Res call({
 String? id, DateTime missingSince, String type,@JsonKey(unknownEnumValue: AnimalCategory.unknown) AnimalCategory category,@JsonKey(unknownEnumValue: Gender.unknown) Gender gender, List<String> pictures, bool? hasChip, String? coloration, String? breed, double? reward, String? additionalInfo, String? phoneNumber, String? userId, double? latitude, double? longitude, String? cityName
});




}
/// @nodoc
class __$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(this._self, this._then);

  final _Report _self;
  final $Res Function(_Report) _then;

/// Create a copy of Report
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? missingSince = null,Object? type = null,Object? category = null,Object? gender = null,Object? pictures = null,Object? hasChip = freezed,Object? coloration = freezed,Object? breed = freezed,Object? reward = freezed,Object? additionalInfo = freezed,Object? phoneNumber = freezed,Object? userId = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? cityName = freezed,}) {
  return _then(_Report(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,missingSince: null == missingSince ? _self.missingSince : missingSince // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AnimalCategory,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,pictures: null == pictures ? _self._pictures : pictures // ignore: cast_nullable_to_non_nullable
as List<String>,hasChip: freezed == hasChip ? _self.hasChip : hasChip // ignore: cast_nullable_to_non_nullable
as bool?,coloration: freezed == coloration ? _self.coloration : coloration // ignore: cast_nullable_to_non_nullable
as String?,breed: freezed == breed ? _self.breed : breed // ignore: cast_nullable_to_non_nullable
as String?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as double?,additionalInfo: freezed == additionalInfo ? _self.additionalInfo : additionalInfo // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
