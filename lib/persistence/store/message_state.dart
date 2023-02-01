import 'package:final_flutter_project/domain/message.dart';
import 'package:flutter/foundation.dart';

@immutable
class MessageState {
  final List<Message> entities;

  const MessageState({
    required this.entities,
  });

  static MessageState initialState = MessageState(
    entities: [
      Message(
        id: 2000,
        text: 'Att',
        createdAt: DateTime.now(),
        userId: 1015,
        friendId: 1016,
      ),
      Message(
        id: 2000,
        text: 'Je test un truc',
        createdAt: DateTime.now(),
        userId: 1016,
        friendId: 1016,
      ),
      Message(
        id: 2000,
        text: 'Fais pas attention',
        createdAt: DateTime.now(),
        userId: 1015,
        friendId: 1016,
      ),
    ],
  );
}
