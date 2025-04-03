import 'package:flutter/material.dart';
import 'package:health_mate/src/service_options/presentaion/widgets/consultant_type_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  void showConsultationType(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        builder: (context) => const ConsultationTypeWidget());
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context); // Quay lại màn hình trước
            },
          ),
          leadingWidth: 25,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
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
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: const [
                  // Incoming message
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ChatBubble(
                      message:
                          "Good afternoon! It's nice to meet you. I see from your background that you have an impressive",
                      isSender: false,
                      time: '8:21 AM',
                    ),
                  ),
                  SizedBox(height: 8),
                  // Outgoing message
                  Align(
                    alignment: Alignment.centerRight,
                    child: ChatBubble(
                      message: "Hello! Thank you for your kind words",
                      isSender: true,
                      time: '8:21 AM',
                    ),
                  ),
                ],
              ),
            ),
            // Message input
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
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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
                    onPressed: () {},
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
