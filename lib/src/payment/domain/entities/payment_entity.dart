class PaymentEntity {
  final String id;
  final String userId;
  final double amount;
  final String method;
  final String status;
  final DateTime createdAt;

  PaymentEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.method,
    required this.status,
    required this.createdAt,
  });
}
