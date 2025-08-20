// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeEntry {

 int? get id; DateTime get start_time; DateTime get end_time;@JsonKey(fromJson: _parseUserId) int get user_id;@JsonKey(fromJson: _parseTotalHours) double get total_hours; String? get note;
/// Create a copy of TimeEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeEntryCopyWith<TimeEntry> get copyWith => _$TimeEntryCopyWithImpl<TimeEntry>(this as TimeEntry, _$identity);

  /// Serializes this TimeEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.start_time, start_time) || other.start_time == start_time)&&(identical(other.end_time, end_time) || other.end_time == end_time)&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.total_hours, total_hours) || other.total_hours == total_hours)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start_time,end_time,user_id,total_hours,note);

@override
String toString() {
  return 'TimeEntry(id: $id, start_time: $start_time, end_time: $end_time, user_id: $user_id, total_hours: $total_hours, note: $note)';
}


}

/// @nodoc
abstract mixin class $TimeEntryCopyWith<$Res>  {
  factory $TimeEntryCopyWith(TimeEntry value, $Res Function(TimeEntry) _then) = _$TimeEntryCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime start_time, DateTime end_time,@JsonKey(fromJson: _parseUserId) int user_id,@JsonKey(fromJson: _parseTotalHours) double total_hours, String? note
});




}
/// @nodoc
class _$TimeEntryCopyWithImpl<$Res>
    implements $TimeEntryCopyWith<$Res> {
  _$TimeEntryCopyWithImpl(this._self, this._then);

  final TimeEntry _self;
  final $Res Function(TimeEntry) _then;

/// Create a copy of TimeEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? start_time = null,Object? end_time = null,Object? user_id = null,Object? total_hours = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,start_time: null == start_time ? _self.start_time : start_time // ignore: cast_nullable_to_non_nullable
as DateTime,end_time: null == end_time ? _self.end_time : end_time // ignore: cast_nullable_to_non_nullable
as DateTime,user_id: null == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as int,total_hours: null == total_hours ? _self.total_hours : total_hours // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeEntry].
extension TimeEntryPatterns on TimeEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeEntry value)  $default,){
final _that = this;
switch (_that) {
case _TimeEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeEntry value)?  $default,){
final _that = this;
switch (_that) {
case _TimeEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime start_time,  DateTime end_time, @JsonKey(fromJson: _parseUserId)  int user_id, @JsonKey(fromJson: _parseTotalHours)  double total_hours,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeEntry() when $default != null:
return $default(_that.id,_that.start_time,_that.end_time,_that.user_id,_that.total_hours,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime start_time,  DateTime end_time, @JsonKey(fromJson: _parseUserId)  int user_id, @JsonKey(fromJson: _parseTotalHours)  double total_hours,  String? note)  $default,) {final _that = this;
switch (_that) {
case _TimeEntry():
return $default(_that.id,_that.start_time,_that.end_time,_that.user_id,_that.total_hours,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime start_time,  DateTime end_time, @JsonKey(fromJson: _parseUserId)  int user_id, @JsonKey(fromJson: _parseTotalHours)  double total_hours,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _TimeEntry() when $default != null:
return $default(_that.id,_that.start_time,_that.end_time,_that.user_id,_that.total_hours,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeEntry implements TimeEntry {
  const _TimeEntry({this.id, required this.start_time, required this.end_time, @JsonKey(fromJson: _parseUserId) required this.user_id, @JsonKey(fromJson: _parseTotalHours) required this.total_hours, this.note});
  factory _TimeEntry.fromJson(Map<String, dynamic> json) => _$TimeEntryFromJson(json);

@override final  int? id;
@override final  DateTime start_time;
@override final  DateTime end_time;
@override@JsonKey(fromJson: _parseUserId) final  int user_id;
@override@JsonKey(fromJson: _parseTotalHours) final  double total_hours;
@override final  String? note;

/// Create a copy of TimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeEntryCopyWith<_TimeEntry> get copyWith => __$TimeEntryCopyWithImpl<_TimeEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.start_time, start_time) || other.start_time == start_time)&&(identical(other.end_time, end_time) || other.end_time == end_time)&&(identical(other.user_id, user_id) || other.user_id == user_id)&&(identical(other.total_hours, total_hours) || other.total_hours == total_hours)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start_time,end_time,user_id,total_hours,note);

@override
String toString() {
  return 'TimeEntry(id: $id, start_time: $start_time, end_time: $end_time, user_id: $user_id, total_hours: $total_hours, note: $note)';
}


}

/// @nodoc
abstract mixin class _$TimeEntryCopyWith<$Res> implements $TimeEntryCopyWith<$Res> {
  factory _$TimeEntryCopyWith(_TimeEntry value, $Res Function(_TimeEntry) _then) = __$TimeEntryCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime start_time, DateTime end_time,@JsonKey(fromJson: _parseUserId) int user_id,@JsonKey(fromJson: _parseTotalHours) double total_hours, String? note
});




}
/// @nodoc
class __$TimeEntryCopyWithImpl<$Res>
    implements _$TimeEntryCopyWith<$Res> {
  __$TimeEntryCopyWithImpl(this._self, this._then);

  final _TimeEntry _self;
  final $Res Function(_TimeEntry) _then;

/// Create a copy of TimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? start_time = null,Object? end_time = null,Object? user_id = null,Object? total_hours = null,Object? note = freezed,}) {
  return _then(_TimeEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,start_time: null == start_time ? _self.start_time : start_time // ignore: cast_nullable_to_non_nullable
as DateTime,end_time: null == end_time ? _self.end_time : end_time // ignore: cast_nullable_to_non_nullable
as DateTime,user_id: null == user_id ? _self.user_id : user_id // ignore: cast_nullable_to_non_nullable
as int,total_hours: null == total_hours ? _self.total_hours : total_hours // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
