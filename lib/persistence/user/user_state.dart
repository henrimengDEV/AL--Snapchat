part of 'user_bloc.dart';

enum UserStatus { initial, success, failure, loading }

abstract class UserState extends Equatable {
  final UserStatus status;
  final List<User> entities;
  final UserFirebase? entity;

  const UserState({
    required this.status,
    required this.entities,
    this.entity,
  });

  UserState copyWith({
    UserStatus? status,
    List<User>? entities,
    UserFirebase? entity,
  });
}

class UserInitial extends UserState {
  const UserInitial({
    super.status = UserStatus.initial,
    super.entities = const <User>[],
    super.entity,
  });

  @override
  UserInitial copyWith({
    UserStatus? status,
    List<User>? entities,
    UserFirebase? entity,
  }) {
    return UserInitial(
      status: status ?? this.status,
      entities: entities ?? this.entities,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [
    status,
    entities,
  ];
}
