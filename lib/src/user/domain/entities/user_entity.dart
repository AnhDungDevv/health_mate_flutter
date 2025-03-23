import 'package:health_mate/src/user/data/models/user_model.dart';

class UserEntity {
  final int? id;
  final String? name;
  final Role? role;
  final String? email;
  final String? phone;
  final String? password;
  final String? avatar;
  final String? referralCode;

  const UserEntity({
    this.id,
    this.name,
    this.role,
    this.email,
    this.password,
    this.phone,
    this.avatar,
    this.referralCode,
  });
}
