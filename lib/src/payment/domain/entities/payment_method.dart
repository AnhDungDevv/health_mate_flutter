class PaymentMethodEntity {
  final String id;
  final String name;
  final bool isActive;
  final String icon;

  const PaymentMethodEntity({
    required this.id,
    required this.name,
    required this.isActive,
    required this.icon,
  });
}
