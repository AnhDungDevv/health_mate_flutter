// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => _WalletModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$WalletModelToJson(_WalletModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'balance': instance.balance,
      'currency': instance.currency,
    };
