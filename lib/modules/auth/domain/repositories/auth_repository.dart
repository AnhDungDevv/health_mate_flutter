import 'package:health_mate/modules/auth/data/models/auth_model.dart';
import 'package:health_mate/modules/auth/domain/entities/customer.dart';

abstract class AuthRepository {
  Future<CustomerEntity> login(String email, String password);
  Future<void> registerUser(UserModel user);
  Future<void> registerConsultant(ConsultantModel consultant);
  Future<void> logout();
}
