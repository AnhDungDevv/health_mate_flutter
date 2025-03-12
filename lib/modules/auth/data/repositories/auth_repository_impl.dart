import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/modules/auth/data/models/user_model.dart';
import 'package:health_mate/modules/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/modules/auth/data/sources/auth_remote_source.dart';
import 'package:health_mate/modules/auth/domain/entities/user_entity.dart';
import 'package:health_mate/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteSource;
  final AuthLocalSource localSource;

  AuthRepositoryImpl({required this.localSource, required this.remoteSource});

  @override
  Future<Either<Failure, UserModel>> register(UserEntity user) async {
    try {
      // Chuyển đổi từ UserEntity sang UserModel
      UserModel userModel = UserModel.fromEntity(user);

      final registeredUser = await remoteSource.register(userModel);
      await localSource.saveUser(registeredUser, user.id as int);

      return Right(registeredUser);
    } catch (e) {
      return Left(ServerFailure("Registration failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, String>> uploadAvatar(File file) async {
    try {
      final url = await remoteSource.uploadAvatar(file);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure("Upload avatar failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      final otp = await remoteSource.sendOtp(phoneNumber);
      return Right(otp);
    } catch (e) {
      return Left(ServerFailure("Send OTP failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(
      String verificationId, String smsCode) async {
    try {
      await remoteSource.verifyOtp(verificationId, smsCode);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Verify OTP failed: ${e.toString()}"));
    }
  }
}
