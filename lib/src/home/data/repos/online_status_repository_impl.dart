import 'package:health_mate/src/home/data/sources/ws_source.dart';
import 'package:health_mate/src/home/doamin/repos/online_status_repository.dart';

class OnlineStatusRepositoryImpl implements IOnlineStatusRepository {
  final OnlineStatusRemoteSource source;

  OnlineStatusRepositoryImpl(this.source);

  @override
  Stream<Map<String, bool>> streamOnlineStatus() {
    return source.connectAndListenStatus();
  }
}
