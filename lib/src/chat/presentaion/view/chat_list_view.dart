import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/chat/presentaion/app/provider/chat_provider.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listConversation = ref.watch(conversationNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.searchChatView);
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: listConversation.when(
        data: (conversations) {
          if (conversations.isEmpty) {
            return const Center(child: Text("No messages yet"));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: conversations.length,
            itemBuilder: (context, index) {
              final conversation = conversations[index];

              final receiver = conversation.receiver;

              return ChatItem(
                id: conversation.id,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.chatView,
                    arguments: conversation.id,
                  );
                },
                name: receiver?.name ?? 'Unknown User',
                message: conversation.lastMessage?.content ?? '',
                time: _formatTime(conversation.updatedAt),
                avatarUrl: receiver?.avatarUrl ?? 'assets/images/default.png',
                isOnline: receiver?.isOnline ?? false,
                isRead: conversation.lastMessage?.isRead ?? false,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes} minutes ago';
    if (diff.inDays < 1) return '${diff.inHours} hours ago';
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class ChatItem extends StatelessWidget {
  final String id;
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isOnline;
  final bool isRead;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.isOnline,
    required this.isRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(id),
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        extentRatio: 0.6,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.more_horiz,
            label: 'More',
          ),
          SlidableAction(
            onPressed: (context) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pinned')),
              );
            },
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.push_pin,
            label: 'Pin',
          ),
          SlidableAction(
            onPressed: (context) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Archived')),
              );
            },
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(avatarUrl),
                  ),
                  if (isOnline)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (isRead)
                    const Icon(Icons.check_circle, color: Colors.blue, size: 16)
                  else
                    const Icon(Icons.circle, color: Colors.blue, size: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
