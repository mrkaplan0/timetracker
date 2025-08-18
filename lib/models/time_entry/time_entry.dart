import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_entry.freezed.dart';
part 'time_entry.g.dart';

@freezed
abstract class TimeEntry with _$TimeEntry {
  const factory TimeEntry({
    required String id,
    required DateTime startTime,
    required DateTime endTime,
    required String userId,
    required double totalHours,
    required DateTime date,
    String? note,
  }) = _TimeEntry;

  factory TimeEntry.fromJson(Map<String, dynamic> json) =>
      _$TimeEntryFromJson(json);
}
