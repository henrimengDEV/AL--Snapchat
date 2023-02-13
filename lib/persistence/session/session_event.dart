part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogIn extends SessionEvent {
  final UserFirebase user;
  LogIn({required this.user});
}

class LogOut extends SessionEvent {}

class SetUser extends SessionEvent {
  final UserFirebase user;

  SetUser(this.user);
}