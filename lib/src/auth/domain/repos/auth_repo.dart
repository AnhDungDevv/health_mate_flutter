import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(UserEntity user);
  Future<Either<Failure, UserEntity>> login(UserEntity user);
  Future<Either<Failure, String>> sendOtp(String phoneNumber);
  Future<Either<Failure, void>> verifyOtp(
      String verificationId, String smsCode);
}
