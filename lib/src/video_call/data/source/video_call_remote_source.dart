// data/sources/video_call_remote_source.dart
import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class VideoCallRemoteSource {
  late final RtcEngine _engine;
  final _remoteUids = <int>[];
  final _remoteUsersController = StreamController<List<int>>.broadcast();

  Stream<List<int>> get remoteUsersStream => _remoteUsersController.stream;

  Future<void> init() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: 'YOUR_APP_ID'));
    await _engine.enableVideo();

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onUserJoined: (_, uid, __) {
          _remoteUids.add(uid);
          _remoteUsersController.add(List.from(_remoteUids));
        },
        onUserOffline: (_, uid, __) {
          _remoteUids.remove(uid);
          _remoteUsersController.add(List.from(_remoteUids));
        },
      ),
    );
  }

  Future<void> joinChannel(String channelId, int? uid, String token) async {
    await _engine.startPreview();
    await _engine.joinChannel(
      token: token,
      channelId: channelId,
      uid: uid ?? 0,
      options: const ChannelMediaOptions(),
    );
  }

  Future<void> leaveChannel() async {
    await _engine.leaveChannel();
    await _engine.stopPreview();
  }

  RtcEngine get engine => _engine;
}
