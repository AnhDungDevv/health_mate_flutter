import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/auth/presentation/app/states/auth_state.dart';
import 'package:health_mate/src/chat/presentaion/app/provider/chat_provider.dart';
import 'package:health_mate/src/service_options/presentaion/widgets/consultant_type_widget.dart';
import 'package:health_mate/src/chat/domain/entity/chat_message_entity.dart';

class ChatView extends ConsumerWidget {
  ChatView({super.key});
  final TextEditingController _messageController = TextEditingController();

  void showConsultationType(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => const ConsultationTypeWidget(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final conversationId = args['conversationId'];
    final authState = ref.watch(authNotifierProvider);

    final currentUserId = authState.when(
      data: (state) {
        if (state.status == AuthStatus.authenticated) {
          return state.authData?.user.id;
        }
        return null;
      },
      loading: () => null,
      error: (error, stackTrace) => null,
    );
    final chatMessages = ref.watch(chatNotifierProvider(conversationId));

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          leadingWidth: 25,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage:
                    AssetImage('assets/images/user_consultant/1.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr. John Doe',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 18)),
                  Text('Ortho Specialist',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.call, color: Colors.black),
              onPressed: () {
                showConsultationType(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.videocam, color: Colors.black),
              onPressed: () {
                showConsultationType(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Chat messages
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final message = chatMessages[index];
                  final bool isSender = message.senderId == currentUserId;
                  return Align(
                    alignment:
                        isSender ? Alignment.centerRight : Alignment.centerLeft,
                    child: ChatBubble(
                      message: message.content,
                      isSender: isSender,
                      time: message.timestamp.toString(),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type your message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      final messageText = _messageController.text.trim();
                      if (messageText.isNotEmpty) {
                        final message = ChatMessageEntity(
                          id: DateTime.now().toString(),
                          conversationId: conversationId,
                          senderId: currentUserId!,
                          receiverId: "receiver_id",
                          type: "text",
                          content: messageText,
                          timestamp: DateTime.now(),
                          isRead: false,
                        );
                        ref
                            .read(chatNotifierProvider(conversationId).notifier)
                            .sendMessage(message);
                        _messageController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSender ? Colors.blue : Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: isSender ? const Radius.circular(12) : Radius.zero,
              bottomRight: isSender ? Radius.zero : const Radius.circular(12),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isSender ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
