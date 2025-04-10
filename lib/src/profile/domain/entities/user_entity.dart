import 'package:health_mate/src/profile/data/model/role.dart';

class UserEntity {
  final String? id;
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
