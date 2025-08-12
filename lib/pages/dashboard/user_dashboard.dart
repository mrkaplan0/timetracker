import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/time_entries/add_time_entry.dart';
import 'package:timetracker/utils/consts.dart';
import 'package:timetracker/widgets/custom_button.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 82, 92),
      appBar: AppBar(title: Text('Home', style: MyConsts.myBigTitleTextStyle)),
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
          ],
        ),
      ),
    );
  }
}
