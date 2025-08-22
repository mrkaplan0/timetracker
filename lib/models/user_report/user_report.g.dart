// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserReport _$UserReportFromJson(Map<String, dynamic> json) => _UserReport(
  userId: TypeFormatter.parseToInt(json['user_id']),
  name: json['name'] as String,
  entryCount: TypeFormatter.parseToInt(json['entry_count']),
  expectedHours: TypeFormatter.parseToDouble(json['expected_hours']),
  totalHours: TypeFormatter.parseToDouble(json['total_hours']),
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
