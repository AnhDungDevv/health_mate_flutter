import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final videoIntroduceProvider = Provider<Uri?>(
    (ref) => Uri.tryParse('')); // Use `Uri.tryParse` to handle invalid URLs.

class VideoIntroduceConsultant extends ConsumerStatefulWidget {
  const VideoIntroduceConsultant({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _VideoIntroduceConsultantState();
  }
}

class _VideoIntroduceConsultantState
    extends ConsumerState<VideoIntroduceConsultant> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    final videoUrl = ref.read(videoIntroduceProvider);

    if (videoUrl != null) {
      _controller = VideoPlayerController.networkUrl(videoUrl)
        ..initialize().then((_) {
          setState(() {
            _isInitialized = true;
          });
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoUrl = ref.watch(videoIntroduceProvider);

    if (videoUrl == '') {
      return const SizedBox();
    }

    return Column(children: [
      const Text(
        'Introduction Video',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Center(
        child: _isInitialized && _controller != null
            ? Stack(children: [
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                ),
                if (!_controller!.value.isPlaying)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _controller!.play();
                      });
                    },
                    icon: const Icon(Icons.play_circle_fill),
                  )
              ])
            : const CircularProgressIndicator(),
      ),
    ]);
  }
}
