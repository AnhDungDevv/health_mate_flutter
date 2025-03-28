import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';

class CheckLoginUsecase {
  final AuthRepository _authRepository;

  CheckLoginUsecase(this._authRepository);
  Future<Either<Failure, UserEntity>> call() async {
    return await _authRepository.checkLogin();
  }
}
