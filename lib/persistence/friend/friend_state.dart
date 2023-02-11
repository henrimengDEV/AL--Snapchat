part of 'friend_bloc.dart';

enum FriendStatus { initial, success, failure, loading }

abstract class FriendState extends Equatable {
  final FriendStatus status;
  final List<Friend> entities;
  final Friend? entity;

  const FriendState({
    required this.status,
    required this.entities,
    this.entity,
  });

  FriendState copyWith({
    FriendStatus? status,
    List<Friend>? entities,
    Friend? entity,
  });
}

class FriendInitial extends FriendState {
  const FriendInitial({
    super.status = FriendStatus.initial,
    super.entities = const <Friend>[],
    super.entity,
  });

  @override
  FriendInitial copyWith({
    FriendStatus? status,
    List<Friend>? entities,
    Friend? entity,
  }) {
    return FriendInitial(
      status: status ?? this.status,
      entities: entities ?? this.entities,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object> get props => [];
}
