import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_mate/app.dart';
import 'package:health_mate/core/notification/local_notification_helper.dart';
import 'package:health_mate/core/notification/notification_service.dart';
import 'package:health_mate/core/storage/prefs_storage_service.dart';
import 'package:health_mate/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearAllCache() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  await secureStorage.deleteAll();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  debugPrint("✅ Đã xóa toàn bộ dữ liệu cache và token.");
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await LocalNotificationHelper.initialize();
  await NotificationService.handleBackgroundNotification(message);
  await LocalNotificationHelper.requestPermissionsIfNeeded();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PrefsStorageService.instance.init();
  await Firebase.initializeApp();
  await LocalNotificationHelper.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}
