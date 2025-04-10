import 'package:health_mate/src/chat/domain/entity/conversation_entity.dart';
import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';

class GetConversationsUseCase {
  final ChatRepository repo;

  GetConversationsUseCase(this.repo);

  Future<List<ConversationEntity>> call(String userId) {
    return repo.getConversations(userId);
  }
}
