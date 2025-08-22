// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminReport _$AdminReportFromJson(Map<String, dynamic> json) => _AdminReport(
  reportPeriod: json['report_period'] as String,
  totalHoursAllUsers: TypeFormatter.parseToDouble(
    json['total_hours_all_users'],
  ),
  users: (json['users'] as List<dynamic>)
      .map((e) => UserReport.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AdminReportToJson(_AdminReport instance) =>
    <String, dynamic>{
      'report_period': instance.reportPeriod,
      'total_hours_all_users': instance.totalHoursAllUsers,
      'users': instance.users,
    };
