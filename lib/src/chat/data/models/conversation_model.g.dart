// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModelImpl _$ConversationModelImplFromJson(
        Map<String, dynamic> json) =>
    _ConversationModelImpl(
      id: json['id'] as String,
      userId1: json['userId1'] as String,
      userId2: json['userId2'] as String,
      lastMessage: json['lastMessage'] == null
          ? null
          : ChatMessageModelImpl.fromJson(
              json['lastMessage'] as Map<String, dynamic>),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ConversationModelImplToJson(
        _ConversationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId1': instance.userId1,
      'userId2': instance.userId2,
      'lastMessage': instance.lastMessage,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
