import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:timetracker/models/time_entry/time_entry.dart';
import 'package:timetracker/providers/entry_provider.dart';
import 'package:timetracker/utils/consts.dart';
import 'package:timetracker/utils/date_formatter.dart';

class TimeEntriesDetailPage extends ConsumerWidget {
  TimeEntriesDetailPage({super.key, this.entries});
  List<TimeEntry>? entries;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: prefer_conditional_assignment
    if (entries == null) {
      entries = ref.watch(entryListProvider).value;
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'Zeiteinträge',
          style: MyConsts.myBigTitleTextStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: entries?.length,
          itemBuilder: (context, index) {
            final entry = entries?[index];
            if (entry == null) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: GlassContainer.frostedGlass(
                height: 170,
                borderColor: Colors.white,
                borderWidth: 1,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            DateFormatter.formatDate(entry.startTime),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.access_time, color: Colors.black54),
                          const SizedBox(width: 8),
                          Text(
                            'Arbeitzeiten: ${DateFormatter.formatTime(entry.startTime)} - ${DateFormatter.formatTime(entry.endTime)}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.timer, color: Colors.black54),
                          const SizedBox(width: 8),
                          Text(
                            'Total Arbeit: ${entry.totalHours} Std.',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      if (entry.note != null && entry.note!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.note, color: Colors.black54),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                entry.note!,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
