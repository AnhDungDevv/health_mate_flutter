class ChatUserEntity {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isOnline;

  ChatUserEntity({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.isOnline,
  });
}
