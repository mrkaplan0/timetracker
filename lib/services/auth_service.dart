import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:timetracker/config/configs.dart';
import 'package:timetracker/models/user/user.dart';
import 'package:timetracker/services/api_service.dart';

class AuthService {
  final ApiService _api = ApiService();
  late final Dio _dio;

  AuthService() {
    _dio = _api.dio;
  }

  /// Register a new user and return (User, token)
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final res = await _dio.post(
        Configs.apiBaseUrl + Configs.registerUrl,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      );

      final data = res.data;
      debugPrint('Register response status: ${res.statusCode}');
      debugPrint('Register response data: $data');
      if (data is! Map<String, dynamic>) {
        throw Exception('Unexpected response format');
      }

      if (data['status'] != 'success') {
        throw Exception('Registration failed: ${data['message']}');
      }

      return true; // Registration successful
    } on DioException catch (e) {
      debugPrint('DioException during registration: ${e.type}');
      debugPrint('DioException message: ${e.message}');

      String errorMessage = getErrorMessage(e);
      throw Exception(errorMessage);
    } catch (e) {
      debugPrint('Unexpected error during registration: $e');
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  /// Login a user
  Future<(User?, String token)> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        Configs.apiBaseUrl + Configs.loginUrl,
        data: {'email': email, 'password': password},
      );

      final data = res.data;

      if (data is! Map<String, dynamic>) {
        throw Exception('Unexpected response format');
      }

      // Check if login was successful
      if (data['status'] != 'success') {
        throw Exception('Login failed: ${data['message'] ?? 'Unknown error'}');
      }

      // Check if user_info is present in the response
      final userJson = data['user_info'];
      if (userJson == null || userJson is! Map<String, dynamic>) {
        throw Exception('User object missing in response');
      }

      // Check if token is present
      final token = data['token'] as String?;
      if (token == null || token.isEmpty) {
        throw Exception('Token missing in response');
      }

      // Set the token in the API service
      await _api.setToken(token);

      print(User.fromJson(userJson));
      return (User.fromJson(userJson), token);
    } on DioException catch (e) {
      debugPrint('DioException during login: ${e.type}');
      debugPrint('DioException message: ${e.message}');
      debugPrint('DioException response status: ${e.response?.statusCode}');
      debugPrint('DioException response data: ${e.response?.data}');

      String errorMessage = getErrorMessage(e);
      throw Exception(errorMessage);
    } catch (e) {
      debugPrint('Unexpected error during login: $e');
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  /// Logout
  Future<bool> logout() async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer ${await _api.getToken()}';
      var response = await _dio.post(Configs.apiBaseUrl + Configs.logoutUrl);
      if (response.statusCode == 200) {
        await _api.clearToken();
        return true;
      } else {
        debugPrint('Logout failed with status code: ${response.statusCode}');
        return false;
      }
    } on DioException catch (e) {
      debugPrint('Unexpected error during logout: $e');
      throw Exception(getErrorMessage(e));
    }
  }

  /// Current user
  Future<User?> currentUser(String token) async {
    try {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final res = await _dio.get(Configs.apiBaseUrl + Configs.currentUserUrl);
      final data = res.data as Map<String, dynamic>;
      if (data.isEmpty) {
        return null; // No user data available
      }
      return User.fromJson(data);
    } on DioException catch (e) {
      debugPrint('DioException fetching current user: ${e.type}');
      debugPrint('DioException message: ${e.message}');
      debugPrint('DioException response: ${e.response?.data}');
      debugPrint('DioException statusCode: ${e.response?.statusCode}');
      return null;
    }
  }

  String getErrorMessage(DioException e) {
    String errorMessage = 'Registration failed: ';
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage += 'Connection timeout';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage += 'Send timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage += 'Receive timeout';
        break;
      case DioExceptionType.connectionError:
        errorMessage +=
            'Connection error. Please check your internet connection.';
        break;
      case DioExceptionType.badResponse:
        errorMessage += 'Server error (${e.response?.statusCode})';
        break;
      case DioExceptionType.cancel:
        errorMessage += 'Request cancelled';
        break;
      case DioExceptionType.unknown:
        errorMessage += 'Unknown error: ${e.message}';
        break;
      default:
        errorMessage += e.message ?? 'Unknown error';
    }
    return errorMessage;
  }
}
