import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';
import 'package:health_mate/src/auth/domain/entities/sign_in_entity.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(UserEntity user);
  Future<Either<Failure, AuthDataEntity>> login(SignInEntity data);
  Future<void> logout();
  Future<AuthDataEntity?> checkAuth();
  Future<AuthDataEntity?> refreshToken();
  Future<String?> getLocalAccessToken();
  Future<Either<Failure, String>> sendOtp(String phoneNumber);
  Future<Either<Failure, void>> verifyOtp(String smsCode);
}
