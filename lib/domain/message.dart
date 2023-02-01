class Message {
  final int id;
  final String text;
  final DateTime createdAt;
  final int userId;
  final int friendId;

  Message({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.friendId,
  });
}
