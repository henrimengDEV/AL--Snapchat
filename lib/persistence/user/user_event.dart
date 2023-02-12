part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchAllUser extends UserEvent {}

class FetchOneUser extends UserEvent {}

class CreateUser extends UserEvent {
  final User user;
  const CreateUser({required this.user});
}
class UpdateUser extends UserEvent {
  final UserFirebase userFirebase;
  const UpdateUser({required this.userFirebase});
}

class RemoveUser extends UserEvent {
  final int id;
  const RemoveUser({required this.id});
}

class ResetAllUser extends UserEvent {}

class ResetOneUser extends UserEvent {}
