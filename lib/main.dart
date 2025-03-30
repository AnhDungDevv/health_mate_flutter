import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_mate/app.dart';
import 'package:health_mate/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearAllCache() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  await secureStorage.deleteAll();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  debugPrint("✅ Đã xóa toàn bộ dữ liệu cache và token.");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await clearAllCache();
  runApp(const MyApp());
}
