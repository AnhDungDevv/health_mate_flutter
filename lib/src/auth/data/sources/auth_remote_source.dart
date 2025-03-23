import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(UserModel user);
  Future<UserModel> login(UserModel user);
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
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "Registration failed: ${response.statusMessage}",
        );
      }
    } on DioException {
      rethrow;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: "/register"),
        error: "Unexpected error: ${error.toString()}",
        type: DioExceptionType.unknown,
      );
    }
  }

  @override
  Future<UserModel> login(UserModel user) async {
    try {
      final response = await _dio.post(
        '/login',
        data: user.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "Login failed: ${response.statusMessage}",
        );
      }
    } on DioException {
      rethrow;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: "/login"),
        error: "Unexpected error: ${error.toString()}",
        type: DioExceptionType.unknown,
      );
    }
  }

  @override
  Future<String> sendOtp(String phoneNumber) async {
    try {
      final response =
          await _dio.post('/send-otp', data: {'phone': phoneNumber});

      if (response.statusCode == 200) {
        return response.data['otp'];
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "Failed to send OTP: ${response.statusMessage}",
        );
      }
    } on DioException {
      rethrow;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: "/send-otp"),
        error: "Unexpected error: ${error.toString()}",
        type: DioExceptionType.unknown,
      );
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String smsCode) async {
    try {
      final response = await _dio
          .post('/verify-otp', data: {'id': verificationId, 'code': smsCode});

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "OTP verification failed: ${response.statusMessage}",
        );
      }
    } on DioException {
      rethrow;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: "/verify-otp"),
        error: "Unexpected error: ${error.toString()}",
        type: DioExceptionType.unknown,
      );
    }
  }
}
