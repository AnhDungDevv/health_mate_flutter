import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';

class DisconnectChatSocketUseCase {
  final ChatRepository repo;

  DisconnectChatSocketUseCase(this.repo);

  Future<void> call() {
    return repo.disconnectSocket();
  }
}
