import 'package:health_mate/modules/auth/data/models/user_model.dart';

class UserEntity {
  final String id;
  final String name;
  final Role role;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? referralCode;

  const UserEntity({
    required this.id,
    required this.name,
    required this.role,
    this.email,
    this.phone,
    this.avatar,
    this.referralCode,
  });
}
