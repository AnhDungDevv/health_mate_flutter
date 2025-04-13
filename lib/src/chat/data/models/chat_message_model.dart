// chat_message_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
sealed class ChatMessageModel with _$ChatMessageModel {
  const ChatMessageModel._();

  const factory ChatMessageModel({
    required String id,
    required String conversationId,
    required String senderId,
    required String receiverId,
    required String type,
    required String content,
    required DateTime timestamp,
    required bool isRead,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  factory ChatMessageModel.fromEntity(ChatMessageEntity entity) =>
      ChatMessageModel(
        id: entity.id,
        conversationId: entity.conversationId,
        senderId: entity.senderId,
        receiverId: entity.receiverId,
        type: entity.type,
        content: entity.content,
        timestamp: entity.timestamp,
        isRead: entity.isRead,
      );
}

extension ChatMessageModelX on ChatMessageModel {
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
