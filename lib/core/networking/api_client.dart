import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart'; // For storing tokens securely

class ApiClient {
  final String baseUrl;
  final Dio _dio;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  var logger = Logger();

  ApiClient({required this.baseUrl})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    // Optional: Set any default configurations like timeouts, interceptors, etc.
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };

    // Add interceptors for logging, authentication, and error handling
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Log request details (for debugging purposes)
        logger.i("Request: ${options.method} ${options.uri}");
        logger.d("Debug log");
        // Add Authorization token if available
        String? token = await _getAuthToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
          logger.i("Added Authorization Header: Bearer $token");
        }

        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        // Log response details (for debugging purposes)
        logger.i("Response: ${response.statusCode} ${response.data}");
        return handler.next(response); // Continue with the response
      },
      onError: (DioException e, handler) async {
        // Log error details (for debugging purposes)
        logger.i("Error: ${e.message}");

        // Handle token expiration and refresh token if necessary
        if (e.response?.statusCode == 401) {
          bool tokenRefreshed = await _refreshAuthToken();
          if (tokenRefreshed) {
            // Retry the original request after refreshing the token
            final options = e.response?.requestOptions;
            final retryRequest = await _dio.request(
              options?.path ?? '',
              options: Options(
                method: options?.method ?? 'GET',
                headers: options?.headers,
              ),
            );
            return handler.resolve(retryRequest);
          }
        }

        return handler.next(e); // Continue with the error
      },
    ));
  }

  // Get Auth Token (from secure storage or wherever it's stored)
  Future<String?> _getAuthToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  // Refresh Auth Token (you can implement this as needed)
  Future<bool> _refreshAuthToken() async {
    try {
      final response = await _dio.post('/refresh-token', data: {
        'refresh_token': await _secureStorage.read(key: 'refresh_token'),
      });

      if (response.statusCode == 200) {
        // Store the new token securely
        await _secureStorage.write(
            key: 'auth_token', value: response.data['access_token']);
        return true;
      } else {
        logger.i('Failed to refresh token');
        return false;
      }
    } catch (e) {
      logger.i("Error refreshing token: $e");
      return false;
    }
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return _handleResponse(response);
    } on DioError catch (e) {
      throw Exception(
          'Failed to load data: ${e.response?.statusCode} ${e.message}');
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: json.encode(body),
      );
      return _handleResponse(response);
    } on DioError catch (e) {
      throw Exception(
          'Failed to post data: ${e.response?.statusCode} ${e.message}');
    }
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return response.data is String
          ? json.decode(response.data)
          : response.data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
