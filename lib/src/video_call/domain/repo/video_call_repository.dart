// domain/repositories/video_call_repository.dart
import 'package:health_mate/src/video_call/domain/entity/video_call_user.dart';

abstract class VideoCallRepository {
  Future<void> init();
  Future<void> joinChannel(
      {required String channelId, int? uid, required String token});
  Future<void> leaveChannel();
  Stream<List<VideoCallUser>> get remoteUsersStream;
}
