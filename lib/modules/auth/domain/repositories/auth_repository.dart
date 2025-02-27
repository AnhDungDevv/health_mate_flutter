import 'package:health_mate/modules/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> signUp(String email, String password);
  Future<void> logout();
}
