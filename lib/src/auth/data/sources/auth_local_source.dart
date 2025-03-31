import 'dart:convert';
import 'package:health_mate/src/auth/data/models/auth_data.dart';
import 'package:health_mate/core/constants/storage_keys.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';
import 'package:health_mate/core/storage/secure_storage_service.dart';
import 'package:health_mate/core/storage/prefs_storage_service.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthData(AuthDataModel authData);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<UserModel?> getUserInfo();
  Future<void> clearAuthData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService _secureStorage = SecureStorageService.instance;
  final PrefsStorageService _prefsStorage = PrefsStorageService.instance;

  @override
  Future<void> saveAuthData(AuthDataModel authData) async {
    await _secureStorage.write(StorageKeys.accessToken, authData.accessToken);
    await _secureStorage.write(StorageKeys.refreshToken, authData.refreshToken);
    await _prefsStorage.write(
        StorageKeys.user, jsonEncode(authData.user.toJson()));
  }

  @override
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(StorageKeys.accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(StorageKeys.refreshToken);
  }

  @override
  Future<UserModel?> getUserInfo() async {
    final userString = await _prefsStorage.read(StorageKeys.user);
    if (userString == null) return null;
    return UserModel.fromJson(jsonDecode(userString));
  }

  @override
  Future<void> clearAuthData() async {
    await _secureStorage.delete(StorageKeys.accessToken);
    await _secureStorage.delete(StorageKeys.refreshToken);
    await _prefsStorage.delete(StorageKeys.user);
  }
}
