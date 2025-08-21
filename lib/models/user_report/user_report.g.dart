// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserReport _$UserReportFromJson(Map<String, dynamic> json) => _UserReport(
  userId: (json['user_id'] as num).toInt(),
  name: json['name'] as String,
  entryCount: (json['entry_count'] as num).toInt(),
  expectedHours: (json['expected_hours'] as num).toDouble(),
  totalHours: (json['total_hours'] as num).toDouble(),
  difference: (json['difference'] as num).toDouble(),
);

Map<String, dynamic> _$UserReportToJson(_UserReport instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'entry_count': instance.entryCount,
      'expected_hours': instance.expectedHours,
      'total_hours': instance.totalHours,
      'difference': instance.difference,
    };
