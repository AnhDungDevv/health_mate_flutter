import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';
import 'package:health_mate/src/auth/domain/entities/sign_in_entity.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<Either<Failure, AuthDataEntity>> call(SignInEntity user) async {
    return await repository.login(user);
  }
}
