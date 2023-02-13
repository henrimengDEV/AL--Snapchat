import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_flutter_project/domain/conversation.dart';
import 'package:final_flutter_project/domain/firebase/conversation_firebase.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc() : super(const ConversationInitial()) {
    on<FetchAllConversation>(_onFetchAllConversation);
    on<FetchOneConversation>(_onFetchOneConversation);
    on<CreateConversation>(_onCreateConversation);
    on<UpdateConversation>(_onUpdateConversation);
    on<RemoveConversation>(_onRemoveConversation);
    on<ResetAllConversation>(_onResetAllConversation);
    on<ResetOneConversation>(_onResetOneConversation);
  }

  _onFetchAllConversation(FetchAllConversation event, Emitter<ConversationState> emit) {
    print('FetchAllConversation');
  }

  _onFetchOneConversation(FetchOneConversation event, Emitter<ConversationState> emit) {
    print('FetchAllConversation');
  }

  _onCreateConversation(CreateConversation event, Emitter<ConversationState> emit) {
    print('CreateConversation');
  }

  _onUpdateConversation(UpdateConversation event, Emitter<ConversationState> emit) {
    print('UpdateConversation');
    print(event.conversationFirebase.toString());
    emit(state.copyWith(entity: event.conversationFirebase));
  }

  _onRemoveConversation(RemoveConversation event, Emitter<ConversationState> emit) {
    print('RemoveConversation');
  }

  _onResetAllConversation(ResetAllConversation event, Emitter<ConversationState> emit) {
    print('ResetAllConversation');
    emit(const ConversationInitial());
  }

  _onResetOneConversation(ResetOneConversation event, Emitter<ConversationState> emit) {
    print('ResetOneConversation');
    emit(const ConversationInitial());
  }
}
