import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';

class OnMessageReceivedUseCase {
  final ChatRepository repo;

  OnMessageReceivedUseCase(this.repo);

  Stream<ChatMessageEntity> call() {
    return repo.onMessageReceived;
  }
}
