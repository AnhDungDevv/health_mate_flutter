import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/chat/presentaion/view/conversations_view.dart';
import 'package:health_mate/src/search/presentation/widgets/search_input.dart';

class SearchChatView extends ConsumerStatefulWidget {
  const SearchChatView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchChatViewState();
}

class _SearchChatViewState extends ConsumerState<SearchChatView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40, right: 16),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      _controller.clear();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Expanded(
                  child: SearchInput(),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            }),
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
