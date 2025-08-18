import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timetracker/models/user/user.dart';
import 'package:timetracker/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final authServiceProvider = Provider((ref) => AuthService());
final storageProvider = Provider((ref) => FlutterSecureStorage());

// Provider to access the token from secure storage
final tokenProvider = FutureProvider<String>((ref) async {
  final storage = ref.watch(storageProvider);
  return await storage.read(key: 'token') ?? '';
});

final currentUserProvider = FutureProvider<User?>((ref) async {
  final authService = ref.watch(authServiceProvider);
  final token = await ref.watch(tokenProvider.future);
  if (token.isEmpty) {
    debugPrint('No token found, returning null user.');
    return null;
  }
  return await authService.currentUser(token);
});

final logoutProvider = FutureProvider<bool>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.logout().then((success) {
    if (success) {
      ref.invalidate(tokenProvider);
      return true;
    } else {
      return false;
    }
  });
});
