import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/entity/chat_user_entity.dart';

part 'conversation_entity.freezed.dart';

@freezed
sealed class ConversationEntity with _$ConversationEntity {
  const factory ConversationEntity({
    required String id,
    required List<String> memberIds,
    ChatMessageEntity? lastMessage,
    required DateTime updatedAt,
    ChatUserEntity? receiver,
  }) = _ConversationEntity;
}
