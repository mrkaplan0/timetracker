// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeEntry _$TimeEntryFromJson(Map<String, dynamic> json) => _TimeEntry(
  id: (json['id'] as num?)?.toInt(),
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  userId: TypeFormatter.parseToInt(json['user_id']),
  totalHours: TypeFormatter.parseToDouble(json['total_hours']),
  note: json['note'] as String?,
);

Map<String, dynamic> _$TimeEntryToJson(_TimeEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'user_id': instance.userId,
      'total_hours': instance.totalHours,
      'note': instance.note,
    };
