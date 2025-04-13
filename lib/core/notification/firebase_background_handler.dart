import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:health_mate/core/notification/local_notification_helper.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  await LocalNotificationHelper.showNotification(
    // message
    title: 'Hello',
    body: 'How are you',
    payload: 'are you ok',
  );
}
