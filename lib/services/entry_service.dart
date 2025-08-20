import 'package:dio/dio.dart';
import 'package:timetracker/config/configs.dart';
import 'package:timetracker/models/time_entry/time_entry.dart';
import 'package:timetracker/services/api_service.dart';

class EntryService {
  final ApiService _api = ApiService();
  late final Dio _dio;

  EntryService() {
    _dio = _api.dio;
  }

  Future<List<TimeEntry>> getEntries() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${await _api.getToken()}';
      final response = await _dio.get(
        Configs.apiBaseUrl + Configs.userEntriesUrl,
      );
      print('Response data: ${response.data}');
      return (response.data["time_entries"] as List)
          .map((entry) => TimeEntry.fromJson(entry))
          .toList();
    } catch (e) {
      throw Exception('Failed to load entries: $e');
    }
  }

  Future<bool> createEntry(TimeEntry entry) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${await _api.getToken()}';
      final response = await _dio.post(
        Configs.apiBaseUrl + Configs.timeEntriesUrl,
        data: entry.toJson(),
      );
      if (response.statusCode != 201) {
        throw Exception('Failed to create entry: ${response.statusMessage}');
      }
      return true;
    } catch (e) {
      throw Exception('Failed to create entry: $e');
    }
  }
}
