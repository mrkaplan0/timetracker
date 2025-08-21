// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserReport {

@JsonKey(name: "user_id") int get userId; String get name;@JsonKey(name: "entry_count") int get entryCount;@JsonKey(name: "expected_hours") double get expectedHours;@JsonKey(name: "total_hours") double get totalHours; double get difference;
/// Create a copy of UserReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserReportCopyWith<UserReport> get copyWith => _$UserReportCopyWithImpl<UserReport>(this as UserReport, _$identity);

  /// Serializes this UserReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserReport&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&(identical(other.expectedHours, expectedHours) || other.expectedHours == expectedHours)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.difference, difference) || other.difference == difference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,entryCount,expectedHours,totalHours,difference);

@override
String toString() {
  return 'UserReport(userId: $userId, name: $name, entryCount: $entryCount, expectedHours: $expectedHours, totalHours: $totalHours, difference: $difference)';
}


}

/// @nodoc
abstract mixin class $UserReportCopyWith<$Res>  {
  factory $UserReportCopyWith(UserReport value, $Res Function(UserReport) _then) = _$UserReportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "user_id") int userId, String name,@JsonKey(name: "entry_count") int entryCount,@JsonKey(name: "expected_hours") double expectedHours,@JsonKey(name: "total_hours") double totalHours, double difference
});




}
/// @nodoc
class _$UserReportCopyWithImpl<$Res>
    implements $UserReportCopyWith<$Res> {
  _$UserReportCopyWithImpl(this._self, this._then);

  final UserReport _self;
  final $Res Function(UserReport) _then;

/// Create a copy of UserReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? entryCount = null,Object? expectedHours = null,Object? totalHours = null,Object? difference = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,expectedHours: null == expectedHours ? _self.expectedHours : expectedHours // ignore: cast_nullable_to_non_nullable
as double,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,difference: null == difference ? _self.difference : difference // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [UserReport].
extension UserReportPatterns on UserReport {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserReport() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserReport value)  $default,){
final _that = this;
switch (_that) {
case _UserReport():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserReport value)?  $default,){
final _that = this;
switch (_that) {
case _UserReport() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "user_id")  int userId,  String name, @JsonKey(name: "entry_count")  int entryCount, @JsonKey(name: "expected_hours")  double expectedHours, @JsonKey(name: "total_hours")  double totalHours,  double difference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserReport() when $default != null:
return $default(_that.userId,_that.name,_that.entryCount,_that.expectedHours,_that.totalHours,_that.difference);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "user_id")  int userId,  String name, @JsonKey(name: "entry_count")  int entryCount, @JsonKey(name: "expected_hours")  double expectedHours, @JsonKey(name: "total_hours")  double totalHours,  double difference)  $default,) {final _that = this;
switch (_that) {
case _UserReport():
return $default(_that.userId,_that.name,_that.entryCount,_that.expectedHours,_that.totalHours,_that.difference);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "user_id")  int userId,  String name, @JsonKey(name: "entry_count")  int entryCount, @JsonKey(name: "expected_hours")  double expectedHours, @JsonKey(name: "total_hours")  double totalHours,  double difference)?  $default,) {final _that = this;
switch (_that) {
case _UserReport() when $default != null:
return $default(_that.userId,_that.name,_that.entryCount,_that.expectedHours,_that.totalHours,_that.difference);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserReport implements UserReport {
  const _UserReport({@JsonKey(name: "user_id") required this.userId, required this.name, @JsonKey(name: "entry_count") required this.entryCount, @JsonKey(name: "expected_hours") required this.expectedHours, @JsonKey(name: "total_hours") required this.totalHours, required this.difference});
  factory _UserReport.fromJson(Map<String, dynamic> json) => _$UserReportFromJson(json);

@override@JsonKey(name: "user_id") final  int userId;
@override final  String name;
@override@JsonKey(name: "entry_count") final  int entryCount;
@override@JsonKey(name: "expected_hours") final  double expectedHours;
@override@JsonKey(name: "total_hours") final  double totalHours;
@override final  double difference;

/// Create a copy of UserReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserReportCopyWith<_UserReport> get copyWith => __$UserReportCopyWithImpl<_UserReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserReport&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.entryCount, entryCount) || other.entryCount == entryCount)&&(identical(other.expectedHours, expectedHours) || other.expectedHours == expectedHours)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.difference, difference) || other.difference == difference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,entryCount,expectedHours,totalHours,difference);

@override
String toString() {
  return 'UserReport(userId: $userId, name: $name, entryCount: $entryCount, expectedHours: $expectedHours, totalHours: $totalHours, difference: $difference)';
}


}

/// @nodoc
abstract mixin class _$UserReportCopyWith<$Res> implements $UserReportCopyWith<$Res> {
  factory _$UserReportCopyWith(_UserReport value, $Res Function(_UserReport) _then) = __$UserReportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "user_id") int userId, String name,@JsonKey(name: "entry_count") int entryCount,@JsonKey(name: "expected_hours") double expectedHours,@JsonKey(name: "total_hours") double totalHours, double difference
});




}
/// @nodoc
class __$UserReportCopyWithImpl<$Res>
    implements _$UserReportCopyWith<$Res> {
  __$UserReportCopyWithImpl(this._self, this._then);

  final _UserReport _self;
  final $Res Function(_UserReport) _then;

/// Create a copy of UserReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? entryCount = null,Object? expectedHours = null,Object? totalHours = null,Object? difference = null,}) {
  return _then(_UserReport(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,entryCount: null == entryCount ? _self.entryCount : entryCount // ignore: cast_nullable_to_non_nullable
as int,expectedHours: null == expectedHours ? _self.expectedHours : expectedHours // ignore: cast_nullable_to_non_nullable
as double,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,difference: null == difference ? _self.difference : difference // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
