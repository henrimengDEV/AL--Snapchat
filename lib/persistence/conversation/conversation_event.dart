part of 'conversation_bloc.dart';

abstract class ConversationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllConversation extends ConversationEvent {}
class FetchOneConversation extends ConversationEvent {}
class CreateConversation extends ConversationEvent {}
class UpdateConversation extends ConversationEvent {}
class RemoveConversation extends ConversationEvent {}
class ResetAllConversation extends ConversationEvent {}
class ResetOneConversation extends ConversationEvent {}