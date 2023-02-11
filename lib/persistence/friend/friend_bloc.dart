import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_flutter_project/domain/friend.dart';
import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/friend/friend_provider.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final FriendProvider friendProvider;

  FriendBloc({
    this.friendProvider = const FriendProvider(),
  }) : super(const FriendInitial()) {
    on<FetchAllFriend>(_onFetchAllFriend);
    on<FetchOneFriend>(_onFetchOneFriend);
    on<CreateFriend>(_onCreateFriend);
    on<UpdateFriend>(_onUpdateFriend);
    on<RemoveFriend>(_onRemoveFriend);
    on<ResetAllFriend>(_onResetAllFriend);
    on<ResetOneFriend>(_onResetOneFriend);

    // Create USE-CASES listeners HERE
    on<FetchAllFriendByUserId>(_onFetchAllFriendByUserId);
  }

  _onFetchAllFriend(FetchAllFriend event, Emitter<FriendState> emit) async {
    print('FetchAllFriend');
    List<Friend> response = await friendProvider.readData(null);
    emit(state.copyWith(entities: response));
  }

  _onFetchOneFriend(FetchOneFriend event, Emitter<FriendState> emit) {
    print('FetchAllFriend');
  }

  _onCreateFriend(CreateFriend event, Emitter<FriendState> emit) async {
    print('CreateFriend');

    final bool friendExist = state.entities
        .where(
          (element) =>
              element.sourceUser == event.sourceUser &&
              element.targetUser == event.targetUser,
        )
        .isNotEmpty;

    if (friendExist) return;

    final Friend newFriend = Friend(
      id: 0,
      sourceUser: event.sourceUser,
      targetUser: event.targetUser,
      createdAt: DateTime.now(),
    );

    final Friend response = await friendProvider.createData(newFriend);

    emit(state.copyWith(entities: [...state.entities, response]));
  }

  _onUpdateFriend(UpdateFriend event, Emitter<FriendState> emit) {
    print('UpdateFriend');
  }

  _onRemoveFriend(RemoveFriend event, Emitter<FriendState> emit) {
    print('RemoveFriend');
  }

  _onResetAllFriend(ResetAllFriend event, Emitter<FriendState> emit) {
    print('ResetAllFriend');
  }

  _onResetOneFriend(ResetOneFriend event, Emitter<FriendState> emit) {
    print('ResetOneFriend');
  }

  // Create USE-CASES listeners HERE

  _onFetchAllFriendByUserId(
    FetchAllFriendByUserId event,
    Emitter<FriendState> emit,
  ) {
    print('FetchAllFriendByUserId');

  }
}
