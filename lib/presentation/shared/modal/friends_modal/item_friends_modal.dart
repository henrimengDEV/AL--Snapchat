import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/friend/friend_bloc.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemFriendsModal extends StatelessWidget {
  final User user;

  const ItemFriendsModal({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SnapAvatar(avatar: user.avatar!),
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
    context.read<FriendBloc>().add(
          CreateFriend(
            sourceUser: context.read<SessionBloc>().state.user!,
            targetUser: user,
          ),
        );
  }
}
