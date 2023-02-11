import 'package:final_flutter_project/domain/friend.dart';
import 'package:final_flutter_project/domain/message.dart';
import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/store/friend_state.dart';
import 'package:final_flutter_project/persistence/store/message_state.dart';
import 'package:final_flutter_project/persistence/store/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreState {
  final UserState user;
  final MessageState message;
  final FriendState friend;

  StoreState({
    required this.user,
    required this.message,
    required this.friend,
  });
}

class StoreCubit extends Cubit<StoreState> {
  StoreCubit()
      : super(StoreState(
          user: UserState.initialState,
          message: MessageState.initialState,
          friend: FriendState.initialState,
        ));

  List<User> getFriendsOfCurrentUser() {
    return state.user.entities
        .where((user) => state.friend.entities.any((element) =>
            element.sourceUser == state.user.currentUser.id &&
            element.targetUser == user.id))
        .toList();
  }

  List<User> getFriendSuggestionsOfCurrentUser() {
    return state.user.entities
        .where((user) => !state.friend.entities.any((element) =>
            element.sourceUser == state.user.currentUser.id &&
            element.targetUser == user.id))
        .toList();
  }

  // addFriend(User user) {
  //   final bool areAlreadyFriend = state.friend.entities.any(
  //     (element) =>
  //         element.sourceUser == state.user.currentUser.id &&
  //         element.targetUser == user.id,
  //   );
  //
  //   if (areAlreadyFriend) return;
  //
  //   emit(
  //     StoreState(
  //       user: state.user,
  //       friend: FriendState(
  //         entities: [
  //           ...state.friend.entities,
  //           Friend(
  //             id: 1,
  //             sourceUser: state.user.currentUser.id,
  //             targetUser: user.id,
  //           )
  //         ],
  //         entity: state.friend.entity,
  //       ),
  //       message: state.message,
  //     ),
  //   );
  // }

  // addUser(User user) => emit(
  //       StoreState(
  //         user: UserState(
  //           entity: state.user.entity,
  //           entities: [...state.user.entities, user],
  //           currentUser: state.user.currentUser,
  //         ),
  //         friend: state.friend,
  //         message: state.message,
  //       ),
  //     );

  updateCurrentUser(User user) {
    emit(StoreState(
      user: UserState(
        entity: state.user.entity,
        entities: state.user.entities,
        currentUser: user,
      ),
      friend: state.friend,
      message: state.message,
    ));
  }

  updateCurrentFriend(int userId) {
    emit(StoreState(
      user: state.user,
      friend: FriendState(
        entities: state.friend.entities,
        entity: state.friend.entities.firstWhere(
          (element) =>
              (element.sourceUser == state.user.currentUser.id &&
                  element.targetUser == userId) ||
              (element.sourceUser == userId &&
                  element.targetUser == state.user.currentUser.id),
        ),
      ),
      message: state.message,
    ));
  }

  Friend getFriendByUserId(int userId) {
    return state.friend.entities.firstWhere(
      (element) =>
          (element.sourceUser == state.user.currentUser.id &&
              element.targetUser == userId) ||
          (element.sourceUser == userId &&
              element.targetUser == state.user.currentUser.id),
    );
  }

  List<Message> getMessagesFromConversation(int friendId) {
    return state.message.entities
        .where((element) => element.friendId == friendId)
        .toList();
  }

  addMessage(Message message) {
    emit(
      StoreState(
        user: state.user,
        friend: state.friend,
        message: MessageState(entities: [...state.message.entities, message]),
      ),
    );
  }
}
