import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';

class SendMessageUseCase {
  final ChatRepository repo;

  SendMessageUseCase(this.repo);

  Future<void> call(ChatMessageEntity message) async {
    return repo.sendMessage(message);
  }
}
