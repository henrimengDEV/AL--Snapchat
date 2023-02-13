import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/conversation_firebase.dart';
import 'package:final_flutter_project/domain/firebase/friend_firebase.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemFriendsModal extends StatelessWidget {
  final UserFirebase user;
  final CollectionReference _friendsCollection =
      FirebaseFirestore.instance.collection('friends');

  final CollectionReference _conversationsCollection =
      FirebaseFirestore.instance.collection('conversations');

  ItemFriendsModal({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SnapAvatar(avatar: user.avatar),
        Expanded(child: Text(user.pseudo)),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25),
          ),
          child: GestureDetector(
            onTap: () => handleAddClick(context),
            child: Row(
              children: const [
                Icon(Icons.add, size: 15),
                Text('Add'),
              ],
            ),
          ),
        )
      ],
    );
  }

  handleAddClick(BuildContext context) {
    _friendsCollection.add(
      FriendFirebase(
        users: [context.read<SessionBloc>().state.user!.id, user.id],
      ).toJson(),
    );

    _conversationsCollection.add(
      ConversationFirebase(
        messages: [],
        users: [context.read<SessionBloc>().state.user!.id, user.id],
      ).toJson(),
    ).then((value) {
      _conversationsCollection.doc(value.id).update({
        'id': value.id,
      });
    }).then((value) => FileUtils.goBack(context));
  }
}
