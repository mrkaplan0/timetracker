import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_report.freezed.dart';
part 'user_report.g.dart';

@freezed
abstract class UserReport with _$UserReport {
  const factory UserReport({
    @JsonKey(name: "user_id") required int userId,
    required String name,
    @JsonKey(name: "entry_count") required int entryCount,
    @JsonKey(name: "expected_hours") required double expectedHours,
    @JsonKey(name: "total_hours") required double totalHours,
    required double difference,
  }) = _UserReport;

  factory UserReport.fromJson(Map<String, dynamic> json) =>
      _$UserReportFromJson(json);
}
