import 'package:health_mate/modules/auth/data/models/user_model.dart';
import 'package:health_mate/modules/auth/domain/entities/customer_entity.dart';

class CustomerModel extends UserModel {
  const CustomerModel({
    required super.id,
    required super.name,
    required super.role,
    super.email,
    super.phone,
    super.avatar,
    super.referralCode,
  });

  factory CustomerModel.fromEntity(CustomerEntity entity) {
    return CustomerModel(
      id: entity.id,
      name: entity.name,
      role: entity.role,
      email: entity.email,
      phone: entity.phone,
      avatar: entity.avatar,
      referralCode: entity.referralCode,
    );
  }

  @override
  CustomerEntity toEntity() {
    return CustomerEntity(
      id: id,
      name: name,
      role: role,
      email: email,
      phone: phone,
      avatar: avatar,
      referralCode: referralCode,
    );
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      role: Role.values.firstWhere(
        (r) => r.name == json['role'],
        orElse: () => Role.customer,
      ),
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      referralCode: json['referralCode'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }
}
