import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_mate/core/utils/global_navigator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalNotificationHelper {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) async {
        final payload = response.payload;
        if (payload != null && payload.isNotEmpty) {
          NavigationService.navigateToChat(payload);
        }
      },
    );
  }

  static Future<void> requestPermissionsIfNeeded() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      channelDescription: 'Basic notification channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    const platformDetails = NotificationDetails(android: androidDetails);

    await _plugin.show(
      0,
      title,
      body,
      platformDetails,
      payload: payload,
    );
  }
}
