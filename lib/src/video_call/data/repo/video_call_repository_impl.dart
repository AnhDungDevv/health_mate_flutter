import 'package:health_mate/src/video_call/data/source/video_call_remote_source.dart';
import 'package:health_mate/src/video_call/domain/entity/video_call_user.dart';
import 'package:health_mate/src/video_call/domain/repo/video_call_repository.dart';

class VideoCallRepositoryImpl implements VideoCallRepository {
  final VideoCallRemoteSource remoteSource;

  VideoCallRepositoryImpl(this.remoteSource);

  @override
  Future<void> init() => remoteSource.init();

  @override
  Future<void> joinChannel(
          {required String channelId, int? uid, required String token}) =>
      remoteSource.joinChannel(channelId, uid, token);

  @override
  Future<void> leaveChannel() => remoteSource.leaveChannel();

  @override
  Stream<List<VideoCallUser>> get remoteUsersStream =>
      remoteSource.remoteUsersStream.map((uids) =>
          uids.map((e) => VideoCallUser(uid: e, isLocal: false)).toList());
}
