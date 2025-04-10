class ChatMessageEntity {
  final String id;
  final String conversationId;
  final String senderId;
  final String receiverId;
  final String type;
  final String content;
  final DateTime timestamp;
  final bool isRead;

  ChatMessageEntity({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.receiverId,
    required this.type,
    required this.content,
    required this.timestamp,
    required this.isRead,
  });
}
