import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/usecase/get_messages_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/on_message_received_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/send_message_usecase.dart';

class ChatNotifier extends StateNotifier<List<ChatMessageEntity>> {
  final String conversationId;
  final GetMessagesUseCase _getMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final OnMessageReceivedUseCase _streamMessagesUseCase;

  Stream<ChatMessageEntity>? _streamSub;

  ChatNotifier({
    required this.conversationId,
    required GetMessagesUseCase getMessages,
    required SendMessageUseCase sendMessage,
    required OnMessageReceivedUseCase streamMessages,
  })  : _getMessagesUseCase = getMessages,
        _sendMessageUseCase = sendMessage,
        _streamMessagesUseCase = streamMessages,
        super([]) {
    loadMessages();
    _listenToStream();
  }

  Future<void> loadMessages() async {
    final result = await _getMessagesUseCase.call(conversationId);
    state = result;
  }

  void _listenToStream() {
    _streamSub = _streamMessagesUseCase.call();
    _streamSub?.listen((message) {
      state = [...state, message];
    });
  }

  Future<void> sendMessage(ChatMessageEntity message) async {
    await _sendMessageUseCase.call(message);
    state = [...state, message];
  }

  @override
  void dispose() {
    _streamSub = null;
    super.dispose();
  }
}
