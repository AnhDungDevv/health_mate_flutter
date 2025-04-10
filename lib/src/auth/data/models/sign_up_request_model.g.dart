// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModelData _$SignUpRequestModelDataFromJson(
        Map<String, dynamic> json) =>
    SignUpRequestModelData(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      referralCode: json['referralCode'] as String?,
      avatar: json['avatar'] as String?,
      role: const RoleConverter().fromJson(json['role'] as String),
      country: json['country'] as String?,
      bio: json['bio'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$SignUpRequestModelDataToJson(
        SignUpRequestModelData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'referralCode': instance.referralCode,
      'avatar': instance.avatar,
      'role': const RoleConverter().toJson(instance.role),
      'country': instance.country,
      'bio': instance.bio,
      'city': instance.city,
    };
