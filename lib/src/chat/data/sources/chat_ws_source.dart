import 'dart:async';
import 'dart:convert';

import 'package:health_mate/core/error/logger.dart';
import 'package:health_mate/core/network/ws.dart';
import 'package:health_mate/src/chat/data/models/chat_message_model.dart';

abstract class ChatWsSource {
  Future<void> disconnect();
  void sendMessage(ChatMessageModel message);
  Stream<ChatMessageModel> get onMessageReceived;
}

class ChatWebSocketSourceImpl implements ChatWsSource {
  final _messageController = StreamController<ChatMessageModel>.broadcast();
  StreamSubscription? _subscription;

  ChatWebSocketSourceImpl() {
    _listenToSocket();
  }

  void _listenToSocket() {
    try {
      _subscription = WebSocketSingleton.instance.channel.stream.listen(
        (data) {
          try {
            final decoded = json.decode(data);

            // Phân loại message theo type
            if (decoded['type'] == 'chat_message') {
              final message = ChatMessageModel.fromJson(decoded['data']);
              _messageController.add(message);
            } else {
              AppLogger.info(' Received other type: ${decoded['type']}');
            }
          } catch (e) {
            AppLogger.error('Error decoding data: $e');
          }
        },
        onError: (error) => AppLogger.error('❌ WebSocket error: $error'),
        onDone: () => AppLogger.info('🔌 WebSocket closed'),
      );
    } catch (e) {
      AppLogger.error(' WebSocket subscription failed: $e');
    }
  }

  @override
  Stream<ChatMessageModel> get onMessageReceived => _messageController.stream;

  @override
  void sendMessage(ChatMessageModel message) {
    final data = json.encode({
      "type": "chat_message",
      "data": message.toJson(),
    });

    WebSocketSingleton.instance.channel.sink.add(data);
  }

  @override
  Future<void> disconnect() async {
    await _subscription?.cancel();
    await _messageController.close();
  }
}
