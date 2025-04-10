// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestModelData _$SignInRequestModelDataFromJson(
        Map<String, dynamic> json) =>
    SignInRequestModelData(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInRequestModelDataToJson(
        SignInRequestModelData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
