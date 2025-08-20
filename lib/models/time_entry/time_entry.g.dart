// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeEntry _$TimeEntryFromJson(Map<String, dynamic> json) => _TimeEntry(
  id: (json['id'] as num?)?.toInt(),
  start_time: DateTime.parse(json['start_time'] as String),
  end_time: DateTime.parse(json['end_time'] as String),
  user_id: _parseUserId(json['user_id']),
  total_hours: _parseTotalHours(json['total_hours']),
  note: json['note'] as String?,
);

Map<String, dynamic> _$TimeEntryToJson(_TimeEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.start_time.toIso8601String(),
      'end_time': instance.end_time.toIso8601String(),
      'user_id': instance.user_id,
      'total_hours': instance.total_hours,
      'note': instance.note,
    };
