import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_mate/core/error/error_handler.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/src/user/data/models/user_model.dart';
import 'package:health_mate/src/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/src/auth/data/sources/auth_remote_source.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteSource;
  final AuthLocalSource localSource;

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

  @override
  Future<Either<Failure, UserModel>> register(UserEntity user) async {
    try {
      final userModel = UserModel.fromEntity(user);
      final registeredUser = await remoteSource.register(userModel);
      await localSource.saveUser(registeredUser, user.id);
      return Right(registeredUser);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error, stackTrace) {
      AppLogger.debug("Unexpected Error in register: $error\n$stackTrace");
      return Left(ServerFailure("Unexpected error: ${error.toString()}"));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(UserEntity user) async {
    try {
      final userModel = UserModel.fromEntity(user);
      final loginUser = await remoteSource.login(userModel);
      await localSource.saveUser(loginUser, user.id);
      AppLogger.debug("User logged in: ${loginUser.toJson()}");
      return Right(loginUser);
    } catch (error, stackTrace) {
      AppLogger.error("Unexpected Error in register:$error\n$stackTrace");
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
}
