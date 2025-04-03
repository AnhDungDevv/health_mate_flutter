import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_mate/core/routing/routes_name.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w400, fontSize: 24)),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (context, index) {
            final chat = chatData[index];
            return ChatItem(
              id: chat['id'] as String,
              onTap: () {
                Navigator.pushNamed(context, RoutesName.chatView);
              },
              name: chat['name']!,
              message: chat['message']!,
              time: chat['time']!,
              avatarUrl: chat['avatarUrl']!,
              isOnline: chat['isOnline']!,
              isRead: chat['isRead']!,
            );
          },
        ),
      ),
    );
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

  const ChatItem(
      {super.key,
      required this.id,
      required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl,
      required this.isOnline,
      required this.isRead,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(id),
      direction: Axis.horizontal,
      endActionPane:
          ActionPane(extentRatio: 0.6, motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          icon: Icons.more_horiz,
          label: 'Xem thêm',
        ),
        SlidableAction(
          onPressed: (context) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ghim được nhấn')),
            );
          },
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          icon: Icons.push_pin,
          label: 'Ghim',
        ),
        // Nút "Lưu trữ"
        SlidableAction(
          onPressed: (context) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Lưu trữ được nhấn')),
            );
          },
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          icon: Icons.archive,
          label: 'Lưu trữ',
        ),
      ]),
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
                    const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 16,
                    )
                  else
                    const Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 10,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> chatData = [
  {
    'id': '1',
    'name': 'Kristin',
    'message': 'I found a 2007 study on effects',
    'time': '00:12',
    'avatarUrl': 'assets/images/user_consultant/1.png',
    'isOnline': true,
    'isRead': false,
  },
  {
    'id': '2',
    'name': 'Ronald',
    'message': 'An average healthy 7 year old',
    'time': '00:12',
    'avatarUrl': 'assets/images/user_consultant/1.png',
    'isOnline': true,
    'isRead': true,
  },
  {
    'id': '3',
    'name': 'Eduardo',
    'message': 'In most states, the legal limit in blood',
    'time': '00:12',
    'avatarUrl': 'assets/images/user_consultant/1.png',
    'isOnline': false,
    'isRead': true,
  },
  {
    'id': '4',
    'name': 'Leslie',
    'message': 'However rare side effects observed',
    'time': '00:12',
    'avatarUrl': 'assets/images/user_consultant/1.png',
    'isOnline': true,
    'isRead': true,
  },
  {
    'id': '5',
    'name': 'Aubrey',
    'message': 'Alcohol based exposures through',
    'time': '00:12',
    'avatarUrl': 'assets/images/user_consultant/1.png',
    'isOnline': false,
    'isRead': true,
  },
  {
    'id': '6',
    'name': 'Soham',
    'message': 'So yes, the alcohol (ethanol) in hand',
    'time': '00:12',
    'avatarUrl': 'assets/images/user_consultant/1.png',
    'isOnline': false,
    'isRead': true,
  },
];
