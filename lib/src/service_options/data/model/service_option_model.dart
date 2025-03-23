import 'package:health_mate/src/service_options/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required super.id,
    required super.name,
    required super.key,
    required super.price,
    required super.enabled,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int,
      name: json['name'] as String,
      key: json['key'] as String,
      price: (json['price'] as num).toDouble(),
      enabled: json['enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "key": key,
      "price": price,
      "enabled": enabled,
    };
  }
}
