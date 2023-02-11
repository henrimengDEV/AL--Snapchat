part of 'conversation_bloc.dart';

enum ConversationStatus { initial, success, failure, loading }

abstract class ConversationState extends Equatable {
  final ConversationStatus status;
  final List<Conversation> entities;
  final Conversation? entity;

  const ConversationState({
    required this.status,
    required this.entities,
    this.entity,
  });
}

class ConversationInitial extends ConversationState {
  const ConversationInitial({
    super.status = ConversationStatus.initial,
    super.entities = const <Conversation>[],
    super.entity,
  });

  ConversationInitial copyWith({
    ConversationStatus? status,
    List<Conversation>? entities,
    Conversation? entity,
  }) {
    return ConversationInitial(
      status: status ?? this.status,
      entities: entities ?? this.entities,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [];
}
