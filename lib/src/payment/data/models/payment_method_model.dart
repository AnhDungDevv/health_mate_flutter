import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/payment/domain/entities/payment_method_entity.dart';

part 'payment_method_model.freezed.dart';
part 'payment_method_model.g.dart';

@freezed
sealed class PaymentMethodModel with _$PaymentMethodModel {
  const factory PaymentMethodModel({
    required String id,
    required String name,
    required bool isActive,
    required String icon,
  }) = _PaymentMethodModel;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);
}

extension PaymentMethodModelX on PaymentMethodModel {
  PaymentMethodEntity toEntity() {
    return PaymentMethodEntity(
      id: id,
      name: name,
      isActive: isActive,
      icon: icon,
    );
  }
}
