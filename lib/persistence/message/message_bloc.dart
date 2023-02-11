import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_flutter_project/domain/message.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageInitial()) {
    on<FetchAllMessage>(_onFetchAllMessage);
    on<FetchOneMessage>(_onFetchOneMessage);
    on<CreateMessage>(_onCreateMessage);
    on<UpdateMessage>(_onUpdateMessage);
    on<RemoveMessage>(_onRemoveMessage);
    on<ResetAllMessage>(_onResetAllMessage);
    on<ResetOneMessage>(_onResetOneMessage);
  }

  _onFetchAllMessage(FetchAllMessage event, Emitter<MessageState> emit) {
    print('FetchAllMessage');
  }

  _onFetchOneMessage(FetchOneMessage event, Emitter<MessageState> emit) {
    print('FetchAllMessage');
  }

  _onCreateMessage(CreateMessage event, Emitter<MessageState> emit) {
    print('CreateMessage');
  }

  _onUpdateMessage(UpdateMessage event, Emitter<MessageState> emit) {
    print('UpdateMessage');
  }

  _onRemoveMessage(RemoveMessage event, Emitter<MessageState> emit) {
    print('RemoveMessage');
  }

  _onResetAllMessage(ResetAllMessage event, Emitter<MessageState> emit) {
    print('ResetAllMessage');
  }

  _onResetOneMessage(ResetOneMessage event, Emitter<MessageState> emit) {
    print('ResetOneMessage');
  }
}
