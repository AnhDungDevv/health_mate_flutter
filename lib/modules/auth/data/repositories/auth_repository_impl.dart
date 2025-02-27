import 'package:health_mate/modules/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/modules/auth/data/sources/auth_remote_source.dart';
import 'package:health_mate/modules/auth/domain/entities/user.dart';
import 'package:health_mate/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource api;
  final AuthLocalSource localDataSource;

  AuthRepositoryImpl({required this.api, required this.localDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    final userModel = await api.login(email, password);
    localDataSource.saveToken(userModel.id);
    return UserEntity(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        phone: '');
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearToken();
  }

  @override
  Future<void> registerConsultant(consultant) {
    // TODO: implement registerConsultant
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
