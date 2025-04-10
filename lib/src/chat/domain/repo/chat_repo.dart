import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/entity/chat_user_entity.dart';
import 'package:health_mate/src/chat/domain/entity/conversation_entity.dart';

abstract class ChatRepository {
  Future<List<ConversationEntity>> getConversations(String userId);
  Future<List<ChatMessageEntity>> getMessages(String conversationId);
  void sendMessage(ChatMessageEntity message);
  Stream<ChatMessageEntity> get onMessageReceived;

  Future<List<ChatUserEntity>> getUsers(List<String> ids);
  Future<void> disconnectSocket();
}
