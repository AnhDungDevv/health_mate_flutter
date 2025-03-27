import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<Either<Failure, String>> call(String phoneNumber) async {
    return await repository.sendOtp(phoneNumber);
  }
}

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, void>> call(String smsCode) async {
    return await repository.verifyOtp(smsCode);
  }
}
