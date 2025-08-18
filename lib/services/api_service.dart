import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  late final Dio _dio;
  String? _token;
  bool _isRefreshing = false;

  ApiService._internal() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5), // Daha kısa timeout
        receiveTimeout: const Duration(seconds: 10), // Daha kısa timeout
        sendTimeout: const Duration(seconds: 5), // Send timeout da ekleyelim
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        // Bu çok önemli: 4xx ve 5xx kodlarını exception'a çevirir
        validateStatus: (status) {
          return status != null && status < 400;
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            // Token varsa ekle
            final token = await getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }

            debugPrint(
              '🚀 REQUEST[${options.method}] => PATH: ${options.path}',
            );
            debugPrint('🚀 HEADERS: ${options.headers}');
            debugPrint('🚀 DATA: ${options.data}');
            return handler.next(options);
          } catch (e) {
            debugPrint('❌ REQUEST INTERCEPTOR ERROR: $e');
            return handler.next(options);
          }
        },
        onResponse: (response, handler) {
          try {
            debugPrint(
              '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
            );

            // HTML response kontrolü
            if (response.data is String &&
                (response.data as String).contains('<!DOCTYPE html>')) {
              debugPrint(
                '❌ HTML RESPONSE DETECTED! API endpoint might be wrong.',
              );
              debugPrint('❌ Expected JSON but got HTML');

              // HTML response'u hata olarak ele al
              final error = DioException(
                requestOptions: response.requestOptions,
                response: response,
                type: DioExceptionType.badResponse,
                message:
                    'API endpoint returned HTML instead of JSON. Check if the endpoint exists.',
              );
              return handler.reject(error);
            }

            debugPrint('✅ RESPONSE DATA: ${response.data}');
            return handler.next(response);
          } catch (e) {
            debugPrint('❌ RESPONSE INTERCEPTOR ERROR: $e');
            return handler.next(response);
          }
        },
        onError: (DioException e, handler) async {
          try {
            debugPrint('❌ ERROR INTERCEPTOR TRIGGERED');
            debugPrint(
              '❌ ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
            );
            debugPrint('❌ ERROR TYPE: ${e.type}');
            debugPrint('❌ ERROR MESSAGE: ${e.message}');
            debugPrint('❌ ERROR RESPONSE DATA: ${e.response?.data}');

            // 401 durumunda token temizle
            if (e.response?.statusCode == 401 && !_isRefreshing) {
              debugPrint('🔄 Token refresh initiated for 401 error');
              _isRefreshing = true;
              try {
                await clearToken();
                debugPrint('🗑️ Token cleared due to 401 error');
              } catch (clearError) {
                debugPrint('❌ Error clearing token: $clearError');
              } finally {
                _isRefreshing = false;
                debugPrint('🔄 Token refresh process completed');
              }
            }

            return handler.next(e);
          } catch (interceptorError) {
            debugPrint('❌ ERROR INTERCEPTOR INTERNAL ERROR: $interceptorError');
            return handler.next(e);
          }
        },
      ),
    );
  }

  Dio get dio => _dio;

  Future<void> setToken(String token) async {
    _token = token;
    await _storage.write(key: 'token', value: token);
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> clearToken() async {
    _token = null;
    await _storage.delete(key: 'token');
    _dio.options.headers.remove('Authorization');
  }

  Future<String?> getToken() async {
    _token ??= await _storage.read(key: 'token');
    return _token;
  }

  // Test fonksiyonu - interceptorları test etmek için
  Future<void> testInterceptors() async {
    debugPrint('🧪 Testing interceptors...');

    try {
      // Başarılı request testi
      await _dio.get('https://httpbin.org/status/200');
      debugPrint('✅ Success test completed');
    } catch (e) {
      debugPrint('❌ Success test failed: $e');
    }

    try {
      // 401 error testi
      await _dio.get('https://httpbin.org/status/401');
      debugPrint('✅ 401 test completed');
    } catch (e) {
      debugPrint('❌ 401 test error: $e');
    }

    try {
      // 404 error testi
      await _dio.get('https://httpbin.org/status/404');
      debugPrint('✅ 404 test completed');
    } catch (e) {
      debugPrint('❌ 404 test error: $e');
    }
  }

  // API sunucu durumunu test et
  Future<void> testApiServer(String baseUrl, String loginUrl) async {
    debugPrint('🧪 Testing API server connectivity...');

    try {
      // Basit GET isteği gönder
      final response = await _dio
          .get(
            baseUrl,
            options: Options(
              receiveTimeout: const Duration(seconds: 5),
              sendTimeout: const Duration(seconds: 3),
            ),
          )
          .timeout(const Duration(seconds: 8));

      debugPrint('✅ API Server is reachable: ${response.statusCode}');

      // HTML response kontrolü
      if (response.data is String &&
          (response.data as String).contains('<!DOCTYPE html>')) {
        debugPrint(
          '⚠️ Server returns HTML - this is likely Laravel welcome page',
        );
        debugPrint('⚠️ API routes might not be properly configured');
      }
    } on DioException catch (e) {
      debugPrint('❌ API Server DioException: ${e.type}');
      debugPrint('❌ Message: ${e.message}');
      if (e.response != null) {
        debugPrint('❌ Response status: ${e.response!.statusCode}');
        debugPrint('❌ Response data: ${e.response!.data}');
      }
    } catch (e) {
      debugPrint('❌ API Server Error: $e');
    }

    // Önce API routes listesi kontrol et
    try {
      debugPrint('🧪 Testing if API routes are available...');
      final response = await _dio
          .get(
            '$baseUrl/api',
            options: Options(
              receiveTimeout: const Duration(seconds: 5),
              sendTimeout: const Duration(seconds: 3),
            ),
          )
          .timeout(const Duration(seconds: 8));

      debugPrint('✅ API base route (/api) response: ${response.statusCode}');
    } on DioException catch (e) {
      debugPrint('❌ API base route (/api) error: ${e.type}');
      if (e.response?.statusCode == 404) {
        debugPrint(
          '❌ /api route not found - API routes might not be registered',
        );
      }
    } catch (e) {
      debugPrint('❌ API base route error: $e');
    }

    // Login endpoint'ini özel olarak test et
    try {
      debugPrint('🧪 Testing login endpoint specifically...');
      final response = await _dio
          .post(
            baseUrl + loginUrl,
            data: {'email': 'test@test.com', 'password': 'test'},
            options: Options(
              receiveTimeout: const Duration(seconds: 5),
              sendTimeout: const Duration(seconds: 3),
            ),
          )
          .timeout(const Duration(seconds: 8));

      debugPrint('✅ Login endpoint is reachable: ${response.statusCode}');
    } on DioException catch (e) {
      debugPrint('❌ Login endpoint DioException: ${e.type}');
      debugPrint('❌ Message: ${e.message}');
      if (e.response != null) {
        debugPrint('❌ Response status: ${e.response!.statusCode}');
        if (e.response!.statusCode == 404) {
          debugPrint('❌ LOGIN ENDPOINT NOT FOUND!');
          debugPrint('❌ Check if Laravel API routes are properly configured');
          debugPrint('❌ Check if routes/api.php contains login route');
        }
      }
    } catch (e) {
      debugPrint('❌ Login endpoint Error: $e');
    }
  }
}
