import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_mate/core/error/error_handler.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/src/auth/data/models/auth_data_model.dart';
import 'package:health_mate/src/auth/data/models/sign_in_request_model.dart';
import 'package:health_mate/src/auth/data/models/sign_up_request_model.dart';
import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';
import 'package:health_mate/src/auth/domain/entities/sign_in_entity.dart';
import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/src/auth/data/sources/auth_remote_source.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteSource;
  final AuthLocalDataSource localSource;

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

  @override
  Future<Either<Failure, AuthDataEntity>> register(SignUpEntity user) async {
    try {
      final requestModel = SignUpRequestModel.data(
        name: user.name,
        email: user.email,
        password: user.password,
        phone: user.phone,
        referralCode: user.referralCode,
        avatar: user.avatar,
        role: user.role,
        country: user.country,
        bio: user.bio,
        city: user.city,
      );

      final responseModel = await remoteSource.register(requestModel);
      final responseEntity = responseModel.toEntity();

      if (responseEntity != null) {
        return Right(responseEntity);
      } else {
        return const Left(ServerFailure('Unexpected error occurred'));
      }
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error, stackTrace) {
      AppLogger.debug("Unexpected Error in register: $error\n$stackTrace");
      return Left(ServerFailure("Unexpected error: ${error.toString()}"));
    }
  }

  @override
  Future<void> logout() async {
    await localSource.clearAuthData();
  }

  @override
  Future<Either<Failure, AuthDataEntity>> login(SignInEntity entity) async {
    try {
      final requestModel = SignInRequestModel.data(
          email: entity.email, password: entity.password);
      final responseModel = await remoteSource.login(requestModel);
      final responseEntity = responseModel.toEntity();
      await localSource.saveAuthData(responseModel);
      return Right(responseEntity!);
    } catch (error, stackTrace) {
      AppLogger.error("Unexpected Error in login: $error\n$stackTrace");
      return Left(ServerFailure("Unexpected error: ${error.toString()}"));
    }
  }

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      final otp = await remoteSource.sendOtp(phoneNumber);
      return Right(otp);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error, stackTrace) {
      AppLogger.error("Unexpected Error in sendOtp: $error\n$stackTrace");
      return Left(ServerFailure("Unexpected error: ${error.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(String smsCode) async {
    try {
      await remoteSource.verifyOtp(smsCode);
      return const Right(null);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error, stackTrace) {
      AppLogger.error("Unexpected Error in verifyOtp: $error\n$stackTrace");
      return Left(ServerFailure("Unexpected error: ${error.toString()}"));
    }
  }

  @override
  Future<AuthDataEntity?> checkAuth() async {
    try {
      final accessToken = await localSource.getAccessToken();
      if (accessToken == null) return null;

      final AuthDataModel? authData = await localSource.getAuthData();
      await localSource.saveAuthData(authData!);
      return authData.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AuthDataEntity?> refreshToken() async {
    try {
      final refreshToken = await localSource.getRefreshToken();
      if (refreshToken == null) return null;

      final authData = await remoteSource.refreshAccessToken(refreshToken);
      await localSource.saveAuthData(authData);
      return authData.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getLocalAccessToken() async {
    try {
      return await localSource.getAccessToken();
    } catch (e) {
      return null;
    }
  }
}
