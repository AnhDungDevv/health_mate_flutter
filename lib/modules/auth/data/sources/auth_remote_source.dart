import 'dart:io';
import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/modules/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(UserModel user);
  Future<String> uploadAvatar(File file);
  Future<String> sendOtp(String phoneNumber);
  Future<void> verifyOtp(String verificationId, String smsCode);
}

class AuthRemoteSource implements AuthRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  @override
  Future<UserModel> register(UserModel user) async {
    try {
      final response = await _dio.post('/register', data: user.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception("Registration failed: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    }
  }

  @override
  Future<String> uploadAvatar(File file) async {
    try {
      final response = await _dio.post('/upload-avatar', data: {'file': file});
      return response.data['url'];
    } catch (e) {
      throw Exception("Upload avatar failed");
    }
  }

  @override
  Future<String> sendOtp(String phoneNumber) async {
    try {
      final response =
          await _dio.post('/send-otp', data: {'phone': phoneNumber});
      return response.data['otp'];
    } catch (e) {
      throw Exception("Send OTP failed");
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String smsCode) async {
    try {
      await _dio
          .post('/verify-otp', data: {'id': verificationId, 'code': smsCode});
    } catch (e) {
      throw Exception("Verify OTP failed");
    }
  }
}
