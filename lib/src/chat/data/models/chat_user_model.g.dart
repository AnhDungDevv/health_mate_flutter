// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatUserModelImpl _$ChatUserModelImplFromJson(Map<String, dynamic> json) =>
    _ChatUserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$ChatUserModelImplToJson(_ChatUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'isOnline': instance.isOnline,
    };
