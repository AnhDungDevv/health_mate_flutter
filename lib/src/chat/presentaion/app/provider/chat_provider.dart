// chat_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/chat/data/repo/chat_repository_impl.dart';
import 'package:health_mate/src/chat/data/sources/chat_remote_source.dart';
import 'package:health_mate/src/chat/data/sources/chat_ws_source.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';
import 'package:health_mate/src/chat/domain/entity/conversation_entity.dart';
import 'package:health_mate/src/chat/domain/repo/chat_repo.dart';
import 'package:health_mate/src/chat/domain/usecase/get_conversations_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/get_messages_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/gets_chat_users_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/on_message_received_usecase.dart';
import 'package:health_mate/src/chat/domain/usecase/send_message_usecase.dart';
import 'package:health_mate/src/chat/presentaion/app/notifier/chat_notifier.dart';
import 'package:health_mate/src/chat/presentaion/app/notifier/conversation_notifier.dart';

final chatRemoteSourceProvider = Provider<ChatRemoteSource>((ref) {
  return ChatRemoteSourceImpl();
});

final chatWsSourceProvider = Provider<ChatWsSource>((ref) {
  return ChatWebSocketSourceImpl();
});
// Repository provider
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepositoryImpl(
    ref.watch(chatRemoteSourceProvider),
    ref.watch(chatWsSourceProvider),
  );
});

// Use case providers
final getConversationsUseCaseProvider =
    Provider<GetConversationsUseCase>((ref) {
  return GetConversationsUseCase(ref.watch(chatRepositoryProvider));
});

final getMessagesUseCaseProvider = Provider<GetMessagesUseCase>((ref) {
  return GetMessagesUseCase(ref.watch(chatRepositoryProvider));
});

final sendMessageUseCaseProvider = Provider<SendMessageUseCase>((ref) {
  return SendMessageUseCase(ref.watch(chatRepositoryProvider));
});

final streamMessagesUseCaseProvider = Provider<OnMessageReceivedUseCase>((ref) {
  return OnMessageReceivedUseCase(ref.watch(chatRepositoryProvider));
});

final getChatUsersUseCaseProvider = Provider<GetChatUsersUseCase>((ref) {
  return GetChatUsersUseCase(ref.watch(chatRepositoryProvider));
});

// ConversationNotifier provider
final conversationNotifierProvider = StateNotifierProvider.autoDispose<
    ConversationNotifier, AsyncValue<List<ConversationEntity>>>((ref) {
  // Get necessary use cases
  final getConversations = ref.watch(getConversationsUseCaseProvider);
  final onMessageReceived = ref.watch(streamMessagesUseCaseProvider);
  final getChatUsersUseCase = ref.watch(getChatUsersUseCaseProvider);

  final userId = "current_user_id";

  final notifier = ConversationNotifier(
    getConversations,
    getChatUsersUseCase,
    onMessageReceived,
  );

  notifier.fetchConversations(userId);

  return notifier;
});

final chatNotifierProvider =
    StateNotifierProvider.family<ChatNotifier, List<ChatMessageEntity>, String>(
        (ref, conversationId) {
  final getMessages = ref.watch(getMessagesUseCaseProvider);
  final sendMessage = ref.watch(sendMessageUseCaseProvider);
  final streamMessages = ref.watch(streamMessagesUseCaseProvider);

  return ChatNotifier(
    conversationId: conversationId,
    getMessages: getMessages,
    sendMessage: sendMessage,
    streamMessages: streamMessages,
  );
});
