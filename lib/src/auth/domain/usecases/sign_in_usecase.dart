import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/user/domain/entities/user_entity.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.login(user);
  }
}
