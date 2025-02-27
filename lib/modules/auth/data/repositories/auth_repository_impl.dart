import 'package:health_mate/modules/auth/data/sources/auth_local_source.dart';
import 'package:health_mate/modules/auth/data/sources/auth_remote_source.dart';
import 'package:health_mate/modules/auth/domain/entities/consultant.dart';
import 'package:health_mate/modules/auth/domain/entities/customer.dart';
import 'package:health_mate/modules/auth/domain/repositories/auth_repository.dart';
import 'package:health_mate/modules/auth/presentation/screens/register/siign_up_screen.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource api;
  final AuthLocalSource localDataSource;

  AuthRepositoryImpl({required this.api, required this.localDataSource});

  @override
  Future<CustomerEntity> login(String email, String password) async {
    final response = await api.login(email, password);
    localDataSource.saveToken(response.id);

    if (response.role == Role.consultant) {
      return ConsultantEntity.fromJson(response.toJson());
    }
    return CustomerEntity.fromJson(response.toJson());
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
