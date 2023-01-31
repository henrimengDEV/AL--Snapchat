import 'package:final_flutter_project/domain/friend.dart';

class FriendCubit {
  final List<Friend> entities;

  FriendCubit({
    required this.entities,
  });

  static FriendCubit initialState = FriendCubit(
    entities: [],
  );
}
