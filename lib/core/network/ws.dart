import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketSingleton {
  static WebSocketSingleton? _instance;
  late final WebSocketChannel channel;

  WebSocketSingleton._internal(String url) {
    channel = WebSocketChannel.connect(Uri.parse(url));
  }

  factory WebSocketSingleton.init(String url) {
    _instance ??= WebSocketSingleton._internal(url);
    return _instance!;
  }

  static WebSocketSingleton get instance {
    if (_instance == null) {
      throw Exception("WebSocketSingleton not initialized");
    }
    return _instance!;
  }

  void dispose() {
    channel.sink.close(status.goingAway);
    _instance = null;
  }
}
