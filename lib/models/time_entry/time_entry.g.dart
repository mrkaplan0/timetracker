// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeEntry _$TimeEntryFromJson(Map<String, dynamic> json) => _TimeEntry(
  id: json['id'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  userId: json['userId'] as String,
  totalHours: (json['totalHours'] as num).toDouble(),
  date: DateTime.parse(json['date'] as String),
  note: json['note'] as String?,
);

Map<String, dynamic> _$TimeEntryToJson(_TimeEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'userId': instance.userId,
      'totalHours': instance.totalHours,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
    };
