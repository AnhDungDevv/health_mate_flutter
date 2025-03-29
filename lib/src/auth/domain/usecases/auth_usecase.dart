import 'package:health_mate/src/auth/domain/entities/auth_entity.dart';
import 'package:health_mate/src/auth/domain/repos/auth_repo.dart';

class AuthUsecase {
  final AuthRepository repository;

  AuthUsecase(this.repository);

  Future<AuthDataEntity?> checkAuth() async {
    return await repository.checkAuth();
  }

  Future<String?> getLocalAccessToken() async {
    return await repository.getLocalAccessToken();
  }
}
