import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_mate/core/error/logger.dart';
import 'base_storage_service.dart';

class SecureStorageService extends BaseStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  SecureStorageService._internal();

  static SecureStorageService get instance => _instance;
  @override
  Future<void> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      AppLogger.error('Error writing to secure storage: $e');
      rethrow;
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      AppLogger.error('Error writing to secure storage: $e');
      return null;
    }
  }

  @override
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }
}
