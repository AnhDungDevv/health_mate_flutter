// chat_user_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_mate/src/chat/domain/entity/chat_user_entity.dart';
part 'chat_user_model.freezed.dart';
part 'chat_user_model.g.dart';

abstract class ChatUserModel {
  String get id;
  String get name;
  String get avatarUrl;
  bool get isOnline;

  ChatUserEntity toEntity();
}

@freezed
sealed class ChatUserModelImpl
    with _$ChatUserModelImpl
    implements ChatUserModel {
  const ChatUserModelImpl._();

  const factory ChatUserModelImpl({
    required String id,
    required String name,
    required String avatarUrl,
    required bool isOnline,
  }) = _ChatUserModelImpl;

  factory ChatUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$ChatUserModelImplFromJson(json);

  factory ChatUserModelImpl.fromEntity(ChatUserEntity entity) =>
      ChatUserModelImpl(
        id: entity.id,
        name: entity.name,
        avatarUrl: entity.avatarUrl,
        isOnline: entity.isOnline,
      );

  @override
  ChatUserEntity toEntity() => ChatUserEntity(
        id: id,
        name: name,
        avatarUrl: avatarUrl,
        isOnline: isOnline,
      );
}
