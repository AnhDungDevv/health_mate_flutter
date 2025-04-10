import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';

class GetMessagesUseCase {
  final ChatRepository repo;

  GetMessagesUseCase(this.repo);

  Future<List<ChatMessageEntity>> call(String conversationId) {
    return repo.getMessages(conversationId);
  }
}
