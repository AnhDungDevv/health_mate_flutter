abstract class IOnlineStatusRepository {
  Stream<Map<String, bool>> streamOnlineStatus();
}
