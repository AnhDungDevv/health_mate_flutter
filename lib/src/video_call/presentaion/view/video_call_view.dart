// presentation/pages/video_call_page.dart
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/video_call/presentaion/app/provider/video_call_providers.dart';

class VideoCallPage extends ConsumerStatefulWidget {
  const VideoCallPage({super.key});

  @override
  ConsumerState<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends ConsumerState<VideoCallPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(initVideoCallUseCaseProvider).call();
      await ref.read(videoCallRepositoryProvider).joinChannel(
          channelId: "ba4a408359da4c37b7cdf8a8640a6663",
          uid: 0,
          token: "token");
    });
  }

  @override
  Widget build(BuildContext context) {
    final remoteUsers = ref.watch(remoteUsersStreamProvider);

    final engine = ref.read(videoCallRemoteSourceProvider).engine;

    return Scaffold(
      appBar: AppBar(title: const Text('Video Call')),
      body: Stack(
        children: [
          AgoraVideoView(
            controller: VideoViewController(
              rtcEngine: engine,
              canvas: const VideoCanvas(uid: 0),
            ),
          ),
          remoteUsers.when(
            data: (users) {
              if (users.isEmpty) return const SizedBox();
              return Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 120,
                  width: 90,
                  child: AgoraVideoView(
                    controller: VideoViewController.remote(
                      rtcEngine: engine,
                      canvas: VideoCanvas(uid: users.first.uid),
                      connection: const RtcConnection(
                          channelId: "ba4a408359da4c37b7cdf8a8640a6663 "),
                    ),
                  ),
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const Text("Lỗi stream"),
          ),
        ],
      ),
    );
  }
}
