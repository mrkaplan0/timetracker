import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/models/time_entry/time_entry.dart';
import 'package:timetracker/services/entry_service.dart';

final entryServiceProvider = Provider<EntryService>((ref) => EntryService());

final entryListProvider = FutureProvider.autoDispose<List<TimeEntry>>((
  ref,
) async {
  final entryService = ref.watch(entryServiceProvider);
  List<TimeEntry> entries = await entryService.getEntries();
  return entries;
});
