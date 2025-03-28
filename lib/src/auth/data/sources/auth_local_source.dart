import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';

class AuthLocalSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Lưu access token vào storage
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: "accessToken", value: token);
    } catch (e) {
      print("❌ Lỗi khi lưu token: $e");
    }
  }

  /// Lưu user vào storage dưới dạng JSON
  Future<void> saveUser(UserModel userData) async {
    try {
      final jsonString = jsonEncode(userData.toJson());
      await _storage.write(key: "user", value: jsonString);
    } catch (e) {
      print("❌ Lỗi khi lưu UserModel: $e");
    }
  }

  /// Lấy access token từ storage
  Future<String?> getToken() async {
    try {
      return await _storage.read(key: "accessToken");
    } catch (e) {
      print("❌ Lỗi khi lấy token: $e");
      return null;
    }
  }

  /// Lấy user từ storage
  Future<UserModel?> getUser() async {
    try {
      final userString = await _storage.read(key: "user");
      if (userString == null) return null;

      final userData = jsonDecode(userString);
      return UserModel.fromJson(userData);
    } catch (e) {
      print("❌ Lỗi khi đọc UserModel: $e");
      return null;
    }
  }

  Future<void> clearAuthData() async {
    try {
      await _storage.delete(key: "accessToken");
      await _storage.delete(key: "user");
    } catch (e) {
      print("❌ Lỗi khi xóa dữ liệu: $e");
    }
  }
}
