// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: const RoleConverter().fromJson(json['role'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      referralCode: json['referralCode'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': const RoleConverter().toJson(instance.role),
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'referralCode': instance.referralCode,
      'password': instance.password,
    };

ConsultantModel _$ConsultantModelFromJson(Map<String, dynamic> json) =>
    ConsultantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: const RoleConverter().fromJson(json['role'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      referralCode: json['referralCode'] as String?,
      password: json['password'] as String?,
      bio: json['bio'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$ConsultantModelToJson(ConsultantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': const RoleConverter().toJson(instance.role),
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'referralCode': instance.referralCode,
      'password': instance.password,
      'bio': instance.bio,
      'country': instance.country,
      'city': instance.city,
    };
