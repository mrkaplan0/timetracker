import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/auth/login_page.dart';
import 'package:timetracker/pages/dashboard/user_dashboard.dart';
import 'package:timetracker/providers/auth_provider.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var token = ref.watch(tokenProvider);

    if (token.isLoading) {
      print('Token is loading...');
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }
    if (token.hasError || token.value == '' || token.value!.isEmpty) {
      print('No valid token found, redirecting to LoginPage...');
      return LoginPage();
    }
    var currentUser = ref.watch(currentUserProvider);

    return currentUser.when(
      data: (user) {
        if (user == null) {
          return LoginPage();
        } else {
          // User is logged in, navigate to the dashboard
          if (user.role == 'admin') {
            return UserDashboard(); // Admin dashboard
          } else if (user.role == 'user') {
            return UserDashboard(); // Regular user dashboard
          }
        }
        // Default fallback to LoginPage if no condition matches
        return LoginPage();
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('Error loading user: $error'))),
    );
  }
}
