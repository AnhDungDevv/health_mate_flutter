import 'package:health_mate/modules/auth/domain/entities/user.dart';
import 'package:health_mate/modules/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> login(String email, String password) {
    return repository.login(email, password);
  }
}
