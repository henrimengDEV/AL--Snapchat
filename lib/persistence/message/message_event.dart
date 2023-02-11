part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllMessage extends MessageEvent {}
class FetchOneMessage extends MessageEvent {}
class CreateMessage extends MessageEvent {}
class UpdateMessage extends MessageEvent {}
class RemoveMessage extends MessageEvent {}
class ResetAllMessage extends MessageEvent {}
class ResetOneMessage extends MessageEvent {}