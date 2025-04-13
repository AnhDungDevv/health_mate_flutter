// conversation_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/chat/domain/entity/conversation_entity.dart';
import 'chat_message_model.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
sealed class ConversationModel with _$ConversationModel {
  const ConversationModel._();

  const factory ConversationModel({
    required String id,
    required String userId1,
    required String userId2,
    ChatMessageModel? lastMessage,
    required DateTime updatedAt,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  factory ConversationModel.fromEntity(ConversationEntity entity) =>
      ConversationModel(
        id: entity.id,
        userId1: entity.memberIds[0],
        userId2: entity.memberIds[1],
        lastMessage: entity.lastMessage != null
            ? ChatMessageModel.fromEntity(entity.lastMessage!)
            : null,
        updatedAt: entity.updatedAt,
      );
}

// Extension để convert model → entity
extension ConversationModelX on ConversationModel {
  ConversationEntity toEntity() => ConversationEntity(
        id: id,
        memberIds: [userId1, userId2],
        lastMessage: lastMessage?.toEntity(),
        updatedAt: updatedAt,
      );
}
