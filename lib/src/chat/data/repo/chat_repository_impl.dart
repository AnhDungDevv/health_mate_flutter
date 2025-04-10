import 'package:health_mate/core/error/failure.dart';
import 'package:health_mate/src/chat/data/models/chat_message_model.dart';
import 'package:health_mate/src/chat/data/sources/chat_remote_source.dart';
import 'package:health_mate/src/chat/data/sources/chat_ws_source.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/entity/chat_user_entity.dart';
import 'package:health_mate/src/chat/domain/entity/conversation_entity.dart';
import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteSource remoteSource;
  final ChatWsSource ws;
  ChatRepositoryImpl(this.remoteSource, this.ws);

  @override
  Future<void> disconnectSocket() => ws.disconnect();

  @override
  Future<List<ConversationEntity>> getConversations(String userId) async {
    try {
      final data = await remoteSource.fetchConversations(userId);
      return data.map((e) => e.toEntity()).toList();
    } catch (error) {
      final failure = Failure.fromException(error);
      throw failure;
    }
  }

  @override
  Future<List<ChatMessageEntity>> getMessages(String conversationId) async {
    try {
      final data = await remoteSource.fetchMessages(conversationId);
      return data.map((e) => e.toEntity()).toList();
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  void sendMessage(ChatMessageEntity message) {
    try {
      final model = ChatMessageModelImpl.fromEntity(message);
      ws.sendMessage(model);
    } catch (error) {
      throw Failure.fromException(error);
    }
  }

  @override
  Future<List<ChatUserEntity>> getUsers(List<String> ids) async {
    try {
      final res = await remoteSource.fetchUsersByIds(ids);
      return res.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Failure.fromException(e);
    }
  }

  @override
  Stream<ChatMessageEntity> get onMessageReceived {
    return ws.onMessageReceived.map((item) => item.toEntity());
  }
}
