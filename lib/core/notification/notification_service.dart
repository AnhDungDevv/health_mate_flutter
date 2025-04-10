import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/core/notification/local_notification_helper.dart';
import 'package:health_mate/core/utils/global_navigator.dart';

class NotificationService {
  static final _fcm = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await _fcm.requestPermission();
    final token = await _fcm.getToken();
    if (token != null) AppLogger.info('🔐 FCM Token: $token');

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  static void _handleForegroundMessage(RemoteMessage message) {
    AppLogger.info('📬 Foreground message: ${message.data}');
    final data = message.data;

    LocalNotificationHelper.showNotification(
      title:
          message.notification?.title ?? data['sender_name'] ?? 'Tin nhắn mới',
      body: message.notification?.body ??
          data['content'] ??
          'Bạn có tin nhắn mới',
      payload: data['conversation_id'] ?? '',
    );
  }

  static void _handleNotificationTap(RemoteMessage message) {
    // final data = message.data;
    // final conversationId = data['conversation_id'];
    // NavigationService.navigateToChat(conversationId);
  }

  static Future<void> handleBackgroundNotification(
      RemoteMessage message) async {
    AppLogger.info('📮 Background message: ${message.data}');
    final data = message.data;

    await LocalNotificationHelper.showNotification(
      title:
          message.notification?.title ?? data['sender_name'] ?? 'Tin nhắn mới',
      body: message.notification?.body ??
          data['content'] ??
          'Bạn có tin nhắn mới',
      payload: data['conversation_id'] ?? '',
    );
  }
}
