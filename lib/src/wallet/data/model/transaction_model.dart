import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/core/serializer/serializers.dart';
import 'package:health_mate/src/wallet/doamin/entities/transaction_entity.dart';

part 'transaction_model.g.dart';

abstract class TransactionModel
    implements Built<TransactionModel, TransactionModelBuilder> {
  String get id;
  String get walletId;
  String get type;
  double get amount;
  String get status;
  DateTime get createdAt;
  TransactionModel._();

  factory TransactionModel([void Function(TransactionModelBuilder) updates]) =
      _$TransactionModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(TransactionModel.serializer, this)
            as Map<String, dynamic>? ??
        {};
  }

  static TransactionModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TransactionModel.serializer, json)!;
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      walletId: walletId,
      type: type,
      amount: amount,
      status: status,
      createdAt: createdAt,
    );
  }

  static TransactionModel fromEntity(TransactionEntity entity) {
    return TransactionModel((b) => b
      ..id = entity.id
      ..walletId = entity.walletId
      ..type = entity.type
      ..amount = entity.amount
      ..status = entity.status
      ..createdAt = entity.createdAt);
  }

  static Serializer<TransactionModel> get serializer =>
      _$transactionModelSerializer;
}
