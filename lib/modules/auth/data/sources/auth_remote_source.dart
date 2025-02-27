import 'package:dio/dio.dart';
import 'package:health_mate/modules/auth/data/models/auth_model.dart';

class AuthRemoteSource {
  final Dio dio;
  AuthRemoteSource(this.dio);

  Future<UserModel> login(String email, String password) async {
    final response = await dio.post('/login', data: {
      'email': email,
      'password': password,
    });
    return UserModel.fromJson(response.data);
  }
}
