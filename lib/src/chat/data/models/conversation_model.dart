import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/chat/domain/entity/conversation_entity.dart';
import 'chat_message_model.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

// Định nghĩa interface với toEntity
abstract class ConversationModel {
  String get id;
  String get userId1;
  String get userId2;
  ChatMessageModel? get lastMessage;
  DateTime get updatedAt;

  ConversationEntity toEntity();
}

@freezed
sealed class ConversationModelImpl
    with _$ConversationModelImpl
    implements ConversationModel {
  const ConversationModelImpl._();

  const factory ConversationModelImpl({
    required String id,
    required String userId1,
    required String userId2,
    ChatMessageModelImpl? lastMessage,
    required DateTime updatedAt,
  }) = _ConversationModelImpl;

  factory ConversationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelImplFromJson(json);

  factory ConversationModelImpl.fromEntity(ConversationEntity entity) =>
      ConversationModelImpl(
        id: entity.id,
        userId1: entity.memberIds[0],
        userId2: entity.memberIds[1],
        lastMessage: entity.lastMessage != null
            ? ChatMessageModelImpl.fromEntity(entity.lastMessage!)
            : null,
        updatedAt: entity.updatedAt,
      );

  @override
  ConversationEntity toEntity() => ConversationEntity(
        id: id,
        memberIds: [userId1, userId2],
        lastMessage: lastMessage?.toEntity(),
        updatedAt: updatedAt,
      );
}

// Hàm helper để serialize lastMessage sang JSON
Map<String, dynamic>? _toJsonLastMessage(ChatMessageModelImpl? message) =>
    message?.toJson();
