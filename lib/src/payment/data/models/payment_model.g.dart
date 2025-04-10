// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      method: json['method'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'method': instance.method,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
