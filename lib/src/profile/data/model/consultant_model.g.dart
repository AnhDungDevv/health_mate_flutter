// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseConsultantModel _$BaseConsultantModelFromJson(Map<String, dynamic> json) =>
    BaseConsultantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: const RoleConverter().fromJson(json['role'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      referralCode: json['referralCode'] as String?,
      bio: json['bio'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$BaseConsultantModelToJson(
        BaseConsultantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': const RoleConverter().toJson(instance.role),
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'referralCode': instance.referralCode,
      'bio': instance.bio,
      'country': instance.country,
      'city': instance.city,
    };
