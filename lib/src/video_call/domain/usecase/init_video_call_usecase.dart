// domain/usecases/init_video_call_usecase.dart
import 'package:health_mate/src/video_call/domain/repo/video_call_repository.dart';

class InitVideoCallUseCase {
  final VideoCallRepository repository;

  InitVideoCallUseCase(this.repository);

  Future<void> call() async => repository.init();
}
