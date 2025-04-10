// chat_message_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

// Định nghĩa interface với toEntity
abstract class ChatMessageModel {
  String get id;
  String get conversationId;
  String get senderId;
  String get receiverId;
  String get type;
  String get content;
  DateTime get timestamp;
  bool get isRead;

  ChatMessageEntity toEntity();
}

@freezed
sealed class ChatMessageModelImpl
    with _$ChatMessageModelImpl
    implements ChatMessageModel {
  const ChatMessageModelImpl._();

  const factory ChatMessageModelImpl({
    required String id,
    required String conversationId,
    required String senderId,
    required String receiverId,
    required String type,
    required String content,
    required DateTime timestamp,
    required bool isRead,
  }) = _ChatMessageModelImpl;

  factory ChatMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelImplFromJson(json);

  factory ChatMessageModelImpl.fromEntity(ChatMessageEntity entity) =>
      ChatMessageModelImpl(
        id: entity.id,
        conversationId: entity.conversationId,
        senderId: entity.senderId,
        receiverId: entity.receiverId,
        type: entity.type,
        content: entity.content,
        timestamp: entity.timestamp,
        isRead: entity.isRead,
      );

  @override
  ChatMessageEntity toEntity() => ChatMessageEntity(
        id: id,
        conversationId: conversationId,
        senderId: senderId,
        receiverId: receiverId,
        type: type,
        content: content,
        timestamp: timestamp,
        isRead: isRead,
      );
}
