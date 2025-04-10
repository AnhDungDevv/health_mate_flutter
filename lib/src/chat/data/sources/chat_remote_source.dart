import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/src/chat/data/models/chat_message_model.dart';
import 'package:health_mate/src/chat/data/models/chat_user_model.dart';
import 'package:health_mate/src/chat/data/models/conversation_model.dart';

abstract class ChatRemoteSource {
  Future<List<ConversationModel>> fetchConversations(String userId);
  Future<List<ChatMessageModel>> fetchMessages(String conversationId);
  Future<void> sendMessage(ChatMessageModel message);
  Future<List<ChatUserModel>> fetchUsersByIds(List<String> ids);
}

class ChatRemoteSourceImpl implements ChatRemoteSource {
  final Dio _dio = ApiClient().dio;

  @override
  Future<List<ConversationModel>> fetchConversations(String userId) async {
    try {
      final res = await _dio.get('/conversations/$userId');
      if (res.statusCode == 200) {
        final data = json.decode(res.data) as List;
        return data
            .map((json) => ConversationModelImpl.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to fetch conversations: ${res.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error when fetching conversations: ${e.message}');
    }
  }

  @override
  Future<List<ChatMessageModel>> fetchMessages(String conversationId) async {
    try {
      final response = await _dio.get('conversations/$conversationId/messages');
      if (response.statusCode == 200) {
        final data = json.decode(response.data) as List;
        return data.map((json) => ChatMessageModelImpl.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load messages');
      }
    } on DioException catch (e) {
      throw Exception('Dio error when fetching conversations: ${e.message}');
    }
  }

  @override
  Future<void> sendMessage(ChatMessageModel message) async {
    try {
      final response = await _dio.post('/messages');
      if (response.statusCode != 200) {
        throw Exception('Failed to send message');
      }
    } on DioException catch (e) {
      throw Exception('Dio error when fetching conversations: ${e.message}');
    }
  }

  @override
  Future<List<ChatUserModel>> fetchUsersByIds(List<String> ids) async {
    try {
      final response = await _dio.post(
        '/users/by-ids',
        data: jsonEncode({"ids": ids}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.data) as List;
        return data.map((json) => ChatUserModelImpl.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch users: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Dio error when fetching users: ${e.message}');
    }
  }
}
