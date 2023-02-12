import 'package:final_flutter_project/domain/message.dart';
import 'package:final_flutter_project/domain/user/user.dart';
import 'package:flutter/foundation.dart';

@immutable
class Conversation {
  final String id;
  final List<User> users;
  final List<Message> messages;
  final DateTime createdAt;

  const Conversation({
    required this.id,
    required this.users,
    required this.messages,
    required this.createdAt,
  });

  Conversation copyWith({
    List<User>? users,
    List<Message>? messages,
    DateTime? createdAt,
  }) {
    return Conversation(
      id: id,
      users: users ?? this.users,
      messages: messages ?? this.messages,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
