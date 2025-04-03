import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/profile/domain/entities/user_entity.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class SignUpUsecase {
  final AuthRepository repository;
  SignUpUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.register(user);
  }
}
