import 'package:health_mate/src/payment/domain/entities/payment_method_entity.dart';

class PaymentMethodModel {
  final String id;
  final String name;
  final bool isActive;
  final String icon;
  const PaymentMethodModel({
    required this.id,
    required this.name,
    required this.isActive,
    required this.icon,
  });
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
        id: json['id'] as String,
        name: json['name'] as String,
        isActive: json['isActive'] as bool,
        icon: json['icon'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isActive': isActive,
      'icon': icon,
    };
  }

  PaymentMethodEntity toEntity() {
    return PaymentMethodEntity(
      id: id,
      name: name,
      isActive: isActive,
      icon: icon,
    );
  }
}
