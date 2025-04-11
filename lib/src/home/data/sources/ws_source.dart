import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class OnlineStatusRemoteSource {
  final _controller = StreamController<Map<String, bool>>();

  void init() {
    final channel =
        WebSocketChannel.connect(Uri.parse('wss://your-backend/ws'));

    channel.stream.listen((event) {
      final decoded = jsonDecode(event);
      if (decoded['type'] == 'status_update') {
        final userId = decoded['userId'];
        final online = decoded['online'];

        _controller.add({userId: online});
      }
    });
  }

  Stream<Map<String, bool>> connectAndListenStatus() {
    init();
    return _controller.stream.asBroadcastStream();
  }
}
