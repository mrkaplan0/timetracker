// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminReport {

@JsonKey(name: "report_period") String get reportPeriod;@JsonKey(name: "total_hours_all_users") int get totalHoursAllUsers; List<UserReport> get users;
/// Create a copy of AdminReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminReportCopyWith<AdminReport> get copyWith => _$AdminReportCopyWithImpl<AdminReport>(this as AdminReport, _$identity);

  /// Serializes this AdminReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminReport&&(identical(other.reportPeriod, reportPeriod) || other.reportPeriod == reportPeriod)&&(identical(other.totalHoursAllUsers, totalHoursAllUsers) || other.totalHoursAllUsers == totalHoursAllUsers)&&const DeepCollectionEquality().equals(other.users, users));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reportPeriod,totalHoursAllUsers,const DeepCollectionEquality().hash(users));

@override
String toString() {
  return 'AdminReport(reportPeriod: $reportPeriod, totalHoursAllUsers: $totalHoursAllUsers, users: $users)';
}


}

/// @nodoc
abstract mixin class $AdminReportCopyWith<$Res>  {
  factory $AdminReportCopyWith(AdminReport value, $Res Function(AdminReport) _then) = _$AdminReportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "report_period") String reportPeriod,@JsonKey(name: "total_hours_all_users") int totalHoursAllUsers, List<UserReport> users
});




}
/// @nodoc
class _$AdminReportCopyWithImpl<$Res>
    implements $AdminReportCopyWith<$Res> {
  _$AdminReportCopyWithImpl(this._self, this._then);

  final AdminReport _self;
  final $Res Function(AdminReport) _then;

/// Create a copy of AdminReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reportPeriod = null,Object? totalHoursAllUsers = null,Object? users = null,}) {
  return _then(_self.copyWith(
reportPeriod: null == reportPeriod ? _self.reportPeriod : reportPeriod // ignore: cast_nullable_to_non_nullable
as String,totalHoursAllUsers: null == totalHoursAllUsers ? _self.totalHoursAllUsers : totalHoursAllUsers // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserReport>,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminReport].
extension AdminReportPatterns on AdminReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminReport value)  $default,){
final _that = this;
switch (_that) {
case _AdminReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminReport value)?  $default,){
final _that = this;
switch (_that) {
case _AdminReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "report_period")  String reportPeriod, @JsonKey(name: "total_hours_all_users")  int totalHoursAllUsers,  List<UserReport> users)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminReport() when $default != null:
return $default(_that.reportPeriod,_that.totalHoursAllUsers,_that.users);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "report_period")  String reportPeriod, @JsonKey(name: "total_hours_all_users")  int totalHoursAllUsers,  List<UserReport> users)  $default,) {final _that = this;
switch (_that) {
case _AdminReport():
return $default(_that.reportPeriod,_that.totalHoursAllUsers,_that.users);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "report_period")  String reportPeriod, @JsonKey(name: "total_hours_all_users")  int totalHoursAllUsers,  List<UserReport> users)?  $default,) {final _that = this;
switch (_that) {
case _AdminReport() when $default != null:
return $default(_that.reportPeriod,_that.totalHoursAllUsers,_that.users);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminReport implements AdminReport {
  const _AdminReport({@JsonKey(name: "report_period") required this.reportPeriod, @JsonKey(name: "total_hours_all_users") required this.totalHoursAllUsers, required final  List<UserReport> users}): _users = users;
  factory _AdminReport.fromJson(Map<String, dynamic> json) => _$AdminReportFromJson(json);

@override@JsonKey(name: "report_period") final  String reportPeriod;
@override@JsonKey(name: "total_hours_all_users") final  int totalHoursAllUsers;
 final  List<UserReport> _users;
@override List<UserReport> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of AdminReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminReportCopyWith<_AdminReport> get copyWith => __$AdminReportCopyWithImpl<_AdminReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminReport&&(identical(other.reportPeriod, reportPeriod) || other.reportPeriod == reportPeriod)&&(identical(other.totalHoursAllUsers, totalHoursAllUsers) || other.totalHoursAllUsers == totalHoursAllUsers)&&const DeepCollectionEquality().equals(other._users, _users));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reportPeriod,totalHoursAllUsers,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'AdminReport(reportPeriod: $reportPeriod, totalHoursAllUsers: $totalHoursAllUsers, users: $users)';
}


}

/// @nodoc
abstract mixin class _$AdminReportCopyWith<$Res> implements $AdminReportCopyWith<$Res> {
  factory _$AdminReportCopyWith(_AdminReport value, $Res Function(_AdminReport) _then) = __$AdminReportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "report_period") String reportPeriod,@JsonKey(name: "total_hours_all_users") int totalHoursAllUsers, List<UserReport> users
});




}
/// @nodoc
class __$AdminReportCopyWithImpl<$Res>
    implements _$AdminReportCopyWith<$Res> {
  __$AdminReportCopyWithImpl(this._self, this._then);

  final _AdminReport _self;
  final $Res Function(_AdminReport) _then;

/// Create a copy of AdminReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reportPeriod = null,Object? totalHoursAllUsers = null,Object? users = null,}) {
  return _then(_AdminReport(
reportPeriod: null == reportPeriod ? _self.reportPeriod : reportPeriod // ignore: cast_nullable_to_non_nullable
as String,totalHoursAllUsers: null == totalHoursAllUsers ? _self.totalHoursAllUsers : totalHoursAllUsers // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserReport>,
  ));
}


}

// dart format on
