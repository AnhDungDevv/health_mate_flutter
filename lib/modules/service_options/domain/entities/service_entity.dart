import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final int id;
  final String name;
  final String key;
  final double price;
  final bool enabled;

  const ServiceEntity({
    required this.id,
    required this.name,
    required this.key,
    required this.price,
    required this.enabled,
  });

  ServiceEntity copyWith({double? price}) {
    return ServiceEntity(
      id: id,
      name: name,
      key: key,
      price: price ?? this.price,
      enabled: enabled,
    );
  }

  @override
  List<Object> get props => [id, name, key, price, enabled];
}
