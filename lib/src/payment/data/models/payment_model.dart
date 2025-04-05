import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:health_mate/src/payment/domain/entities/payment_entity.dart';

part 'payment_model.g.dart';

abstract class PaymentModel
    implements Built<PaymentModel, PaymentModelBuilder> {
  String get id;
  String get userId;
  double get amount;
  String get method;
  String get status;
  DateTime get createdAt;

  PaymentModel._();
  factory PaymentModel([void Function(PaymentModelBuilder) updates]) =
      _$PaymentModel;

  static Serializer<PaymentModel> get serializer => _$paymentModelSerializer;

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel((b) => b
      ..id = json['id']
      ..userId = json['userId']
      ..amount = (json['amount'] as num).toDouble()
      ..method = json['method']
      ..status = json['status']
      ..createdAt = DateTime.parse(json['createdAt']));
  }

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
