// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCustomerModel _$BaseCustomerModelFromJson(Map<String, dynamic> json) =>
    BaseCustomerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: const RoleConverter().fromJson(json['role'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      referralCode: json['referralCode'] as String?,
    );

Map<String, dynamic> _$BaseCustomerModelToJson(BaseCustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': const RoleConverter().toJson(instance.role),
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'referralCode': instance.referralCode,
    };
