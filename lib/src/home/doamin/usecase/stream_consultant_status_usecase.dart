import 'package:health_mate/src/home/doamin/repos/online_status_repository.dart';

class StreamConsultantStatusUseCase {
  final IOnlineStatusRepository repository;

  StreamConsultantStatusUseCase(this.repository);

  Stream<Map<String, bool>> call() {
    return repository.streamOnlineStatus();
  }
}
