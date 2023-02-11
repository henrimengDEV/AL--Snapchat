part of 'friend_bloc.dart';

abstract class FriendEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllFriend extends FriendEvent {}

class FetchOneFriend extends FriendEvent {}

class CreateFriend extends FriendEvent {
  final User sourceUser;
  final User targetUser;

  CreateFriend({
    required this.sourceUser,
    required this.targetUser,
  });
}

class UpdateFriend extends FriendEvent {}

class RemoveFriend extends FriendEvent {}

class ResetAllFriend extends FriendEvent {}

class ResetOneFriend extends FriendEvent {}

// Create USE-CASES events HERE

class FetchAllFriendByUserId extends FriendEvent {
  final int userId;

  FetchAllFriendByUserId({required this.userId});
}

