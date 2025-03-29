import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_mate/src/auth/data/models/auth_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_mate/core/constants/storage_keys.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthData(AuthDataModel authData);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<UserModel?> getUserInfo();
  Future<void> clearAuthData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> saveAuthData(AuthDataModel authData) async {
    final prefs = await SharedPreferences.getInstance();
    await _secureStorage.write(
        key: StorageKeys.accessToken, value: authData.accessToken);
    await _secureStorage.write(
        key: StorageKeys.refreshToken, value: authData.refreshToken);
    await prefs.setString(StorageKeys.user, jsonEncode(authData.user.toJson()));
  }

  @override
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: StorageKeys.accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: StorageKeys.refreshToken);
  }

  @override
  Future<UserModel?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(StorageKeys.user);
    if (userString == null) return null;
    return UserModel.fromJson(jsonDecode(userString));
  }

  @override
  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await _secureStorage.delete(key: StorageKeys.accessToken);
    await _secureStorage.delete(key: StorageKeys.refreshToken);
    await prefs.remove(StorageKeys.user);
  }

  Future<void> clearSecureStorage() async {
    await _secureStorage.deleteAll();
  }
}
