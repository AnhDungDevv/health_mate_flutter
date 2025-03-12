import 'package:health_mate/modules/auth/domain/entities/user_entity.dart';

enum Role { consultant, customer }

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.role,
    super.email,
    super.phone,
    super.avatar,
    super.referralCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: Role.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => Role.customer,
      ),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      referralCode: json['referralCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role.name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'referralCode': referralCode,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      role: entity.role,
      email: entity.email,
      phone: entity.phone,
      avatar: entity.avatar,
      referralCode: entity.referralCode,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      role: role,
      email: email,
      phone: phone,
      avatar: avatar,
      referralCode: referralCode,
    );
  }
}
