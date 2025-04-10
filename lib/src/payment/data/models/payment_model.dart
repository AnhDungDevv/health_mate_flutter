import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/payment/domain/entities/payment_entity.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
sealed class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    required String userId,
    required double amount,
    required String method,
    required String status,
    required DateTime createdAt,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

extension PaymentModelX on PaymentModel {
  PaymentEntity toEntity() {
    return PaymentEntity(
      id: id,
      userId: userId,
      amount: amount,
      method: method,
      status: status,
      createdAt: createdAt,
    );
  }
}
