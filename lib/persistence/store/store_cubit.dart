import 'package:final_flutter_project/domain/friend.dart';
import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreState {
  final UserCubit user;
  final List<Friend> friend;

  StoreState({
    required this.user,
    required this.friend,
  });
}

class StoreCubit extends Cubit<StoreState> {
  StoreCubit()
      : super(StoreState(
          user: UserCubit.initialState,
          friend: [],
        ));

  List<User> getFriendsOfCurrentUser() {
    return state.user.entities
        .where((user) => !state.friend.any((element) =>
            element.firstUserId == state.user.currentUser.id &&
            element.secondUserId == user.id))
        .toList();
  }

  void addFriend(Friend friend) {
    final bool areAlreadyFriend = state.friend.any(
      (element) =>
          element.firstUserId == state.user.currentUser.id &&
          element.secondUserId == friend.secondUserId,
    );

    if (areAlreadyFriend) return;

    emit(
      StoreState(
        user: state.user,
        friend: [...state.friend, friend],
      ),
    );
  }

  void addUser(User user) => emit(
        StoreState(
          user: UserCubit(
            entity: state.user.entity,
            entities: [...state.user.entities, user],
            currentUser: state.user.currentUser,
          ),
          friend: state.friend,
        ),
      );
}
