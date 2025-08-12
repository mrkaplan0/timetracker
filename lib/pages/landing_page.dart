import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/auth/login_page.dart';
import 'package:timetracker/pages/dashboard/user_dashboard.dart';
import 'package:timetracker/pages/splash/splash_screen.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UserDashboard();
  }
}
