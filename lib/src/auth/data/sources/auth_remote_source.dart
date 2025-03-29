import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/auth/data/models/auth_data.dart';
import 'package:health_mate/src/auth/data/models/sign_in_request_model.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';
import 'dart:async';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(UserModel user);
  Future<AuthDataModel> login(SignInRequestModel data);
  Future<AuthDataModel> refreshAccessToken(String refreshToken);
  Future<AuthDataModel> getAuthData();
  Future<String> sendOtp(String phoneNumber);
  Future<void> verifyOtp(String smsCode);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio = ApiClient().dio;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;
  @override
  Future<AuthDataModel> getAuthData() async {
    final response = await _dio.get('/me');
    return AuthDataModel.fromJson(response.data);
  }

  @override
  Future<AuthDataModel> refreshAccessToken(String refreshToken) async {
    final response = await _dio.post('/auth/refresh', data: {
      'refreshToken': refreshToken,
    });
    return AuthDataModel.fromJson(response.data);
  }

  @override
  Future<AuthDataModel> login(SignInRequestModel data) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: data.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthDataModel.fromJson(response.data);
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
        requestOptions: RequestOptions(path: "/api/v1/auth/login"),
        error: "Unexpected error: ${error.toString()}",
        type: DioExceptionType.unknown,
      );
    }
  }

  @override
  Future<UserModel> register(UserModel user) async {
    try {
      final response = await _dio.post('/auth/register', data: user.toJson());

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
  Future<String> sendOtp(String phoneNumber) async {
    final Completer<String> completer = Completer();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          completer.completeError(DioException(
            requestOptions: RequestOptions(path: "/send-otp"),
            error: "Firebase Auth Error: ${e.message}",
            type: DioExceptionType.badResponse,
          ));
        },
        codeSent: (String verificationId, int? resendToken) {
          completer.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          completer.completeError(DioException(
            requestOptions: RequestOptions(path: "/send-otp"),
            error: "OTP retrieval timeout",
            type: DioExceptionType.connectionTimeout,
          ));
        },
      );

      return completer.future;
    } catch (error) {
      throw DioException(
        requestOptions: RequestOptions(path: "/send-otp"),
        error: "Unexpected error: ${error.toString()}",
        type: DioExceptionType.unknown,
      );
    }
  }

  @override
  Future<void> verifyOtp(String smsCode) async {
    try {
      final response = await _dio.post('/verify-otp', data: {
        "verification_id": _verificationId,
        "otp": smsCode,
      });

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
