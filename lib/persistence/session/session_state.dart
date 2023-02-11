part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  final User? user;

  const SessionState({
    required this.user,
  });

  SessionState copyWith({
    User? user,
  });
}

class SessionInitial extends SessionState {
  const SessionInitial({
    super.user,
  });

  @override
  SessionInitial copyWith({User? user}) {
    return SessionInitial(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [];
}
