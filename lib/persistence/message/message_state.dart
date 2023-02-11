part of 'message_bloc.dart';

enum MessageStatus { initial, success, failure, loading }

abstract class MessageState extends Equatable {
  final MessageStatus status;
  final List<Message> entities;
  final Message? entity;

  const MessageState({
    required this.status,
    required this.entities,
    this.entity,
  });
}

class MessageInitial extends MessageState {
  const MessageInitial({
    super.status = MessageStatus.initial,
    super.entities = const <Message>[],
    super.entity,
  });

  MessageInitial copyWith({
    MessageStatus? status,
    List<Message>? entities,
    Message? entity,
  }) {
    return MessageInitial(
      status: status ?? this.status,
      entities: entities ?? this.entities,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [];
}
