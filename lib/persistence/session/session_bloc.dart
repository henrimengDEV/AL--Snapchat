import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_flutter_project/domain/user.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(const SessionInitial()) {
    on<SessionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
