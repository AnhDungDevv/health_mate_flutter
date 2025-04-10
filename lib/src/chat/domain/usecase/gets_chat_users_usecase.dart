import 'package:health_mate/src/chat/domain/entity/chat_user_entity.dart';
import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';

class GetChatUsersUseCase {
  final ChatRepository repo;

  GetChatUsersUseCase(this.repo);

  Future<List<ChatUserEntity>> call(List<String> ids) {
    return repo.getUsers(ids);
  }
}
