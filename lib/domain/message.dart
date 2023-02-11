import 'package:flutter/foundation.dart';

@immutable
class Message {
  final int id;
  final String text;
  final DateTime createdAt;
  final int userId;
  final int friendId;

  const Message({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.friendId,
  });

  Message copyWith({
    int? id,
    String? text,
    DateTime? createdAt,
    int? userId,
    int? friendId,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      friendId: friendId ?? this.friendId,
    );
  }
}
