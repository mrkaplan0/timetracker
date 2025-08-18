import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/time_entries/add_time_entry.dart';
import 'package:timetracker/providers/auth_provider.dart';
import 'package:timetracker/utils/consts.dart';
import 'package:timetracker/widgets/custom_button.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
