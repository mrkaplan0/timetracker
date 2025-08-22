import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetracker/utils/type_formatter.dart';

part 'user_report.freezed.dart';
part 'user_report.g.dart';

@freezed
abstract class UserReport with _$UserReport {
  const factory UserReport({
    @JsonKey(fromJson: TypeFormatter.parseToInt, name: "user_id")
    required int userId,
    required String name,
    @JsonKey(fromJson: TypeFormatter.parseToInt, name: "entry_count")
    required int entryCount,
    @JsonKey(fromJson: TypeFormatter.parseToDouble, name: "expected_hours")
    required double expectedHours,
    @JsonKey(fromJson: TypeFormatter.parseToDouble, name: "total_hours")
    required double totalHours,
    required double difference,
  }) = _UserReport;

  factory UserReport.fromJson(Map<String, dynamic> json) =>
      _$UserReportFromJson(json);
}
