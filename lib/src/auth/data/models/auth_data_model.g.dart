// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDataModelSuccess _$AuthDataModelSuccessFromJson(
        Map<String, dynamic> json) =>
    AuthDataModelSuccess(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      expiresIn: (json['expiresIn'] as num).toInt(),
      status: json['status'] as String,
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AuthDataModelSuccessToJson(
        AuthDataModelSuccess instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'expiresIn': instance.expiresIn,
      'status': instance.status,
      'message': instance.message,
      'runtimeType': instance.$type,
    };

AuthDataModelError _$AuthDataModelErrorFromJson(Map<String, dynamic> json) =>
    AuthDataModelError(
      status: json['status'] as String,
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AuthDataModelErrorToJson(AuthDataModelError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'runtimeType': instance.$type,
    };
