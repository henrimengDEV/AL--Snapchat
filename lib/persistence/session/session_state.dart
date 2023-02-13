part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  final UserFirebase? user;

  const SessionState({
    required this.user,
  });

  SessionState copyWith({
    UserFirebase? user,
  });

  @override
  List<Object> get props => [user != null];
}

class SessionInitial extends SessionState {
  const SessionInitial({
    super.user,
  });

  @override
  SessionInitial copyWith({
    UserFirebase? user,
  }) {
    return SessionInitial(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [super.user != null];
}
