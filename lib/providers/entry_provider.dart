import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/models/time_entry/time_entry.dart';
import 'package:timetracker/services/entry_service.dart';

final entryServiceProvider = Provider<EntryService>((ref) => EntryService());

final entryListProvider = FutureProvider.autoDispose<List<TimeEntry>>((
  ref,
) async {
  final entryService = ref.read(entryServiceProvider);
  List<TimeEntry> entries = await entryService.getEntries();
  return entries;
});

final adminReportProvider = FutureProvider.autoDispose((ref) async {
  final entryService = ref.read(entryServiceProvider);
  return await entryService.getAdminReport();
});

final getOneUserEntriesProvider = FutureProvider.autoDispose
    .family<List<TimeEntry>, String>((ref, userId) async {
      final entryService = ref.read(entryServiceProvider);

      List<TimeEntry> entries = await entryService.getEntriesByUserId(userId);
      return entries;
    });
