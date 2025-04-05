import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_mate/app.dart';
import 'package:health_mate/core/constants/storage_keys.dart';
import 'package:health_mate/core/storage/prefs_storage_service.dart';
import 'package:health_mate/core/storage/secure_storage_service.dart';
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
  await PrefsStorageService.instance.init();
  final value =
      await SecureStorageService.instance.read(StorageKeys.accessToken);
  print("🔐 accessToken: $value");
  try {
    await dotenv.load(fileName: "./.env");
  } catch (e) {
    debugPrint("❌ Failed to load .env file: $e");
  }

  runApp(const MyApp());
}
