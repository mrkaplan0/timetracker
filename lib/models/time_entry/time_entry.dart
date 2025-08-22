import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetracker/utils/type_formatter.dart';

part 'time_entry.freezed.dart';
part 'time_entry.g.dart';

// Helper functions for JSON parsing

@freezed
abstract class TimeEntry with _$TimeEntry {
  const factory TimeEntry({
    int? id,
    @JsonKey(name: "start_time") required DateTime startTime,
    @JsonKey(name: "end_time") required DateTime endTime,
    @JsonKey(fromJson: TypeFormatter.parseToInt, name: "user_id")
    required int userId,
    @JsonKey(fromJson: TypeFormatter.parseToDouble, name: "total_hours")
    required double totalHours,
    String? note,
  }) = _TimeEntry;

  factory TimeEntry.fromJson(Map<String, dynamic> json) =>
      _$TimeEntryFromJson(json);
}
