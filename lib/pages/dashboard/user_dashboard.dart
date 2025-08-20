import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/time_entries/add_time_entry.dart';
import 'package:timetracker/providers/auth_provider.dart';
import 'package:timetracker/providers/entry_provider.dart';
import 'package:timetracker/utils/consts.dart';
import 'package:timetracker/widgets/custom_button.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var timeEntries = ref.watch(entryServiceProvider).getEntries();
    print(timeEntries);
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text(
          'Home',
          style: MyConsts.myBigTitleTextStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _logout(context, ref);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 20),
            CustomButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddTimeEntryPage(),
                  ),
                );
              },
              imagePath: 'assets/images/add.jpg',
              height: 250,
              label: 'Fehlzeit Eintrag',
              icon: Icons.add,
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: ref.watch(entryServiceProvider).getEntries(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Fehler beim Laden der Einträge: ${snapshot.error}',
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Keine Einträge gefunden.'));
                } else {
                  final entries = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      return ListTile(
                        title: Text('${entry.start_time} - ${entry.end_time}'),
                        subtitle: Text('Stunden: ${entry.total_hours}'),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context, WidgetRef ref) {
    ref.read(logoutProvider);
    ref.invalidate(currentUserProvider);
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil('/landing', (Route<dynamic> route) => false);
  }
}
