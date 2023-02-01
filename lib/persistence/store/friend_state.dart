import 'package:final_flutter_project/domain/friend.dart';
import 'package:flutter/foundation.dart';

@immutable
class FriendState {
  final List<Friend> entities;
  final Friend? entity;

  const FriendState({
    required this.entities,
    this.entity,
  });

  static FriendState initialState = const FriendState(
    entities: [],
  );
}
