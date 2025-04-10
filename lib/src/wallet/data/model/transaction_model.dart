import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/wallet/doamin/entities/transaction_entity.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
sealed class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String walletId,
    required String type,
    required double amount,
    required String status,
    required DateTime createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  factory TransactionModel.fromEntity(TransactionEntity entity) =>
      TransactionModel(
        id: entity.id,
        walletId: entity.walletId,
        type: entity.type,
        amount: entity.amount,
        status: entity.status,
        createdAt: entity.createdAt,
      );
}

extension TransactionModelX on TransactionModel {
  TransactionEntity toEntity() => TransactionEntity(
        id: id,
        walletId: walletId,
        type: type,
        amount: amount,
        status: status,
        createdAt: createdAt,
      );
}
