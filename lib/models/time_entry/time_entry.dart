// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_entry.freezed.dart';
part 'time_entry.g.dart';

// Helper functions for JSON parsing
int _parseUserId(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.parse(value);
  if (value is num) return value.toInt();
  throw ArgumentError('Cannot parse user_id from $value');
}

double _parseTotalHours(dynamic value) {
  if (value is double) return value;
  if (value is String) return double.parse(value);
  if (value is num) return value.toDouble();
  throw ArgumentError('Cannot parse total_hours from $value');
}

@freezed
abstract class TimeEntry with _$TimeEntry {
  const factory TimeEntry({
    int? id,
    @JsonKey(name: "start_time") required DateTime startTime,
    @JsonKey(name: "end_time") required DateTime endTime,
    @JsonKey(fromJson: _parseUserId, name: "user_id") required int userId,
    @JsonKey(fromJson: _parseTotalHours, name: "total_hours")
    required double totalHours,
    String? note,
  }) = _TimeEntry;

  factory TimeEntry.fromJson(Map<String, dynamic> json) =>
      _$TimeEntryFromJson(json);
}
