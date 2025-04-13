import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/video_call/data/repo/video_call_repository_impl.dart';
import 'package:health_mate/src/video_call/data/source/video_call_remote_source.dart';
import 'package:health_mate/src/video_call/domain/entity/video_call_user.dart';
import 'package:health_mate/src/video_call/domain/repo/video_call_repository.dart';
import 'package:health_mate/src/video_call/domain/usecase/init_video_call_usecase.dart';

final videoCallRemoteSourceProvider =
    Provider((ref) => VideoCallRemoteSource());

final videoCallRepositoryProvider = Provider<VideoCallRepository>(
  (ref) => VideoCallRepositoryImpl(ref.read(videoCallRemoteSourceProvider)),
);

final initVideoCallUseCaseProvider = Provider(
  (ref) => InitVideoCallUseCase(ref.read(videoCallRepositoryProvider)),
);

final remoteUsersStreamProvider = StreamProvider<List<VideoCallUser>>((ref) {
  final repo = ref.read(videoCallRepositoryProvider);
  return repo.remoteUsersStream;
});
