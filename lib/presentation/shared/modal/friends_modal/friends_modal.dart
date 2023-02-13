import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/friend_firebase.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/shared/modal/friends_modal/item_friends_modal.dart';
import 'package:final_flutter_project/presentation/shared/snap_title_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsModal extends StatelessWidget {
  static showIt(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const FriendsModal(),
    );
  }

  const FriendsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromRGBO(235, 235, 235, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 12,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => FileUtils.goBack(context),
                      child: const Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                    const Expanded(child: Center(child: Text('Add Friends'))),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),
              const SnapTitleDivider(text: 'Quick Add'),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BlocBuilder<SessionBloc, SessionState>(
                  builder: (context, sessionState) {
                    return StreamBuilder<List<FriendFirebase>>(
                      stream: _streamFriends(context, sessionState),
                      builder: (_, snapshotFriends) {
                        if (snapshotFriends.hasError) {
                          Text("Error: ${snapshotFriends.error}");
                        }
                        if (!snapshotFriends.hasData) {
                          print(snapshotFriends.hasData);
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return StreamBuilder<List<UserFirebase>>(
                          stream: _usersStream(),
                          builder: (_, snapshotUsers) {
                            if (snapshotUsers.hasError) {
                              Text("Error: ${snapshotUsers.error}");
                            }
                            if (!snapshotUsers.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            return Column(
                                children: snapshotUsers.data!
                                    .where((elementUser) => _areNotFriend(
                                          elementUser,
                                          snapshotFriends,
                                          sessionState,
                                        ))
                                    .map(
                              (user) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    ItemFriendsModal(user: user),
                                    const Divider(),
                                  ],
                                );
                              },
                            ).toList());
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<UserFirebase>> _usersStream() =>
      FirebaseFirestore.instance.collection('users').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => UserFirebase.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<FriendFirebase>> _streamFriends(
    BuildContext context,
    SessionState sessionState,
  ) {
    return FirebaseFirestore.instance
        .collection('friends')
        .where('users', arrayContains: sessionState.user!.id)
        .snapshots()
        .map(
          (snapshotFriends) => snapshotFriends.docs
              .map((e) => FriendFirebase.fromJson(e.data()))
              .toList(),
        );
  }

  bool _areNotFriend(
    UserFirebase elementUser,
    AsyncSnapshot<List<FriendFirebase>> snapshotFriends,
    SessionState sessionState,
  ) {
    bool isUserSession = elementUser.id == sessionState.user!.id;
    bool isAlreadyFriend = snapshotFriends.data!.any(
      (element) =>
          element.users.contains(elementUser.id) &&
          element.users.contains(sessionState.user!.id),
    );

    return !isAlreadyFriend && !isUserSession;
  }
}
