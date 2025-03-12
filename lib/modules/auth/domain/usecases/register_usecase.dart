import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/modules/auth/domain/entities/user_entity.dart';
import 'package:health_mate/modules/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.register(user);
  }
}
