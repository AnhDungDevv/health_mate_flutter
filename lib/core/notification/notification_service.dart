import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/core/notification/local_notification_helper.dart';
import 'package:health_mate/core/utils/global_navigator.dart';

class NotificationService {
  static final _fcm = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await _fcm.requestPermission();
    final token = await _fcm.getToken();
    if (token != null) {
      AppLogger.info('token fcm : $token');
    }

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  static void _handleForegroundMessage(RemoteMessage message) {
    final data = message.data;

    final isOnChatScreen =
        NavigationService.isOnChatWithUser(data['sender_id']);
    if (!isOnChatScreen) {
      LocalNotificationHelper.showNotification(
        title: message.notification?.title ?? data['sender_name'],
        body: message.notification?.body ?? data['content'],
        payload: data['conversation_id'],
      );
    }
  }

  static void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    final conversationId = data['conversation_id'];
    final senderId = data['sender_id'];

    NavigationService.navigateToChat(conversationId, senderId);
  }
}
