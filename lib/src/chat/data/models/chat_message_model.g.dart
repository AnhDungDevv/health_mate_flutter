// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageModelImpl _$ChatMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _ChatMessageModelImpl(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$ChatMessageModelImplToJson(
        _ChatMessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'type': instance.type,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'isRead': instance.isRead,
    };
