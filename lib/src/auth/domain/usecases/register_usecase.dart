import 'package:dartz/dartz.dart';
import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';
import 'package:health_mate/src/auth/domain/entities/sign_up_entity.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class SignUpUsecase {
  final AuthRepository repository;
  SignUpUsecase(this.repository);

  Future<Either<Failure, AuthDataEntity>> call(SignUpEntity data) async {
    return await repository.register(data);
  }
}
