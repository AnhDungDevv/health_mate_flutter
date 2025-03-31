import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'base_storage_service.dart';

class SecureStorageService extends BaseStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  SecureStorageService._internal();

  static SecureStorageService get instance => _instance;

  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }
}
