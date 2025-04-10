import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/core/network/api_client.dart';

class SendFcmTokenToBackend {
  static final Dio _dio = ApiClient().dio;
  static Future<void> sendFcmTokenToBackend(String token) async {
    try {
      final response = await _dio.post(
        '/fcm-token',
        data: jsonEncode({'fcm_token': token}),
      );

      if (response.statusCode == 200) {
        AppLogger.info('FCM token sent successfully');
      } else {
        AppLogger.error('Failed to send FCM token: ${response.data}');
      }
    } catch (e, stack) {
      AppLogger.error('Error sending FCM token: $e  $stack');
    }
  }
}
