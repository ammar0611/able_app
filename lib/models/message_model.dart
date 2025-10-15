class Message {
  final String id;
  final String text;
  final bool isMe;
  final DateTime timestamp;
  final bool isTyping;

  Message({
    required this.id,
    required this.text,
    required this.isMe,
    required this.timestamp,
    this.isTyping = false,
  });
}

class Chat {
  final String id;
  final String name;
  final String avatar;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;
  final bool isOnline;
  final String? imageUrl;

  Chat({
    required this.id,
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.timestamp,
    this.unreadCount = 0,
    this.isOnline = false,
    this.imageUrl,
  });
}
