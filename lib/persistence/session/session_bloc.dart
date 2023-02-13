import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/domain/user/user.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(const SessionInitial()) {
    on<LogIn>(_onLogIn);
    on<LogOut>(_onLogOut);
    on<SetUser>(_onSetUser);
  }
}

_onLogIn(LogIn event, Emitter<SessionState> emit) {
  print('LogIn');
  emit(SessionInitial(
    user: event.user
  ));
}

_onLogOut(LogOut event, Emitter<SessionState> emit) {
  print('LogOut');
  emit(const SessionInitial());
}

_onSetUser(SetUser event, Emitter<SessionState> emit) {
  print('SetUser');
  // emit(SessionInitial(
  //     user: event.user
  // ));
}