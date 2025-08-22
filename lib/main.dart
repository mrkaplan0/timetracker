import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/pages/auth/login_page.dart';
import 'package:timetracker/pages/auth/register_page.dart';
import 'package:timetracker/pages/dashboard/admin_dashboard.dart';
import 'package:timetracker/pages/dashboard/user_dashboard.dart';
import 'package:timetracker/pages/landing_page.dart';
import 'package:timetracker/pages/splash/splash_screen.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('Global error: ${details.exception}');
  };
  runApp(ProviderScope(child: const MyApp()));
}

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      navigatorKey: rootNavigatorKey,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/user_dashboard': (context) => const UserDashboard(),
        '/admin_dashboard': (context) => AdminDashboard(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/landing': (context) => const LandingPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
    );
  }
}
