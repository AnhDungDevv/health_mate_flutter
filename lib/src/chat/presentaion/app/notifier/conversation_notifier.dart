import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/chat/domain/entity/chat_user_entity.dart';
import 'package:health_mate/src/chat/domain/entity/conversation_entity.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/usecase/get_conversations_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/gets_chat_users_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/on_message_received_usecase.dart';

class ConversationNotifier
    extends StateNotifier<AsyncValue<List<ConversationEntity>>> {
  final GetConversationsUseCase _getConversationsUseCase;
  final GetChatUsersUseCase _getChatUsersUseCase;
  final OnMessageReceivedUseCase _onMessageReceivedUseCase;

  late final StreamSubscription<ChatMessageEntity> _messageSub;

  ConversationNotifier(
    this._getConversationsUseCase,
    this._getChatUsersUseCase,
    this._onMessageReceivedUseCase,
  ) : super(const AsyncLoading()) {
    _listenToIncomingMessages();
  }

  Future<void> fetchConversations(String userId) async {
    state = const AsyncLoading();
    final result = await _getConversationsUseCase.call(userId);

    final userIds = result
        .map((conversation) => conversation.memberIds)
        .expand((x) => x)
        .where((id) => id != userId)
        .toList();

    final users = await _getChatUsersUseCase.call(userIds);

    final updatedConversations = _updateConversationsWithUsers(result, users);

    state = AsyncValue.data(updatedConversations);
  }

  void refresh(String userId) {
    fetchConversations(userId);
  }

  void _listenToIncomingMessages() {
    _messageSub = _onMessageReceivedUseCase.call().listen((message) async {
      final currentState = state.value ?? [];
      final updatedConversations =
          _updateConversationList(currentState, message);

      final updatedWithReceiver =
          await _addReceiverInfoToConversations(updatedConversations);

      state = AsyncValue.data(updatedWithReceiver);
    });
  }

  List<ConversationEntity> _updateConversationList(
      List<ConversationEntity> currentConversations,
      ChatMessageEntity message) {
    final updatedConversations = currentConversations.map((conversation) {
      if (conversation.memberIds.contains(message.senderId) &&
          conversation.memberIds.contains(message.receiverId)) {
        return conversation.copyWith(
          lastMessage: message,
          updatedAt: message.timestamp,
        );
      }
      return conversation;
    }).toList();

    if (!updatedConversations
        .any((conv) => conv.id == message.conversationId)) {
      final newConversation = ConversationEntity(
        id: message.conversationId,
        memberIds: [message.senderId, message.receiverId],
        lastMessage: message,
        updatedAt: message.timestamp,
      );
      updatedConversations.add(newConversation);
    }

    return updatedConversations;
  }

  List<ConversationEntity> _updateConversationsWithUsers(
      List<ConversationEntity> conversations, List<ChatUserEntity> users) {
    return conversations.map((conversation) {
      final receiverId = conversation.memberIds.firstWhere(
          (id) =>
              id !=
              "currentUserId", // Lấy người nhận (người không phải là currentUser)
          orElse: () => conversation.memberIds[0]);

      final receiver = users.firstWhere((user) => user.id == receiverId,
          orElse: () => ChatUserEntity(
                id: receiverId,
                name: receiverId,
                avatarUrl: 'assets/images/default.png',
                isOnline: true,
              ));

      return conversation.copyWith(
        lastMessage: conversation.lastMessage,
        updatedAt: conversation.updatedAt,
        receiver: receiver,
      );
    }).toList();
  }

  // Cập nhật cuộc trò chuyện 1-1 với thông tin người nhận
  Future<List<ConversationEntity>> _addReceiverInfoToConversations(
      List<ConversationEntity> conversations) async {
    final userIds = conversations
        .map((conversation) => conversation.memberIds)
        .expand((x) => x)
        .toList();

    final users = await _getChatUsersUseCase.call(userIds);

    return conversations.map((conversation) {
      // Xử lý người nhận
      final receiverId = conversation.memberIds
          .firstWhere((id) => id != "currentUserId", // Lọc người nhận
              orElse: () => conversation.memberIds[0]);

      final receiver = users.firstWhere((user) => user.id == receiverId,
          orElse: () => ChatUserEntity(
                id: receiverId,
                name: receiverId,
                avatarUrl: 'assets/images/default.png',
                isOnline: true,
              ));

      return conversation.copyWith(
        receiver: receiver,
      );
    }).toList();
  }

  @override
  void dispose() {
    _messageSub.cancel();
    super.dispose();
  }
}
