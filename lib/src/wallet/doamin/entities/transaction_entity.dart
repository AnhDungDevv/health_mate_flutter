class TransactionEntity {
  final String id;
  final String walletId;
  final String type; // deposit | withdraw
  final double amount;
  final String status;
  final DateTime createdAt;

  TransactionEntity({
    required this.id,
    required this.walletId,
    required this.type,
    required this.amount,
    required this.status,
    required this.createdAt,
  });
}
