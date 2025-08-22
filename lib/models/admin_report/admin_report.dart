// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetracker/models/user_report/user_report.dart';
import 'package:timetracker/utils/type_formatter.dart';

part 'admin_report.freezed.dart';
part 'admin_report.g.dart';

@freezed
abstract class AdminReport with _$AdminReport {
  const factory AdminReport({
    @JsonKey(name: "report_period") required String reportPeriod,
    @JsonKey(
      fromJson: TypeFormatter.parseToDouble,
      name: "total_hours_all_users",
    )
    required double totalHoursAllUsers,
    required List<UserReport> users,
  }) = _AdminReport;

  factory AdminReport.fromJson(Map<String, dynamic> json) =>
      _$AdminReportFromJson(json);
}
