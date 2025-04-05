import 'dart:convert';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/src/auth/data/models/auth_data.dart';
import 'package:health_mate/core/constants/storage_keys.dart';
import 'package:health_mate/src/profile/data/model/user_model.dart';
import 'package:health_mate/core/storage/secure_storage_service.dart';
import 'package:health_mate/core/storage/prefs_storage_service.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthData(AuthDataModel authData);
  Future<AuthDataModel?> getAuthData();

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
  Future<AuthDataModel?> getAuthData() async {
    try {
      final accessToken = await _secureStorage.read(StorageKeys.accessToken);
      final refreshToken = await _secureStorage.read(StorageKeys.refreshToken);
      final userString = await _prefsStorage.read(StorageKeys.user);

      if (accessToken == null || refreshToken == null || userString == null) {
        AppLogger.info('Auth data is incomplete');
        return null;
      }

      final user = UserModel.fromJson(jsonDecode(userString));
      return AuthDataModel((b) => b
        ..accessToken = accessToken
        ..refreshToken = refreshToken
        ..user.replace(user)
        ..expiresIn = 0
        ..status = 'success'
        ..message = 'Local restored');
    } catch (e, st) {
      AppLogger.error('getAuthData error');
      return null;
    }
  }

  @override
  Future<String?> getAccessToken() async {
    final value = await _secureStorage.read(StorageKeys.accessToken);
    AppLogger.info('Aceesotkern -----: $value');
    return value;
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
