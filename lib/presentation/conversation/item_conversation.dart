import 'package:final_flutter_project/domain/firebase/message_firebase.dart';
import 'package:final_flutter_project/domain/message.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/persistence/user/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemConversation extends StatelessWidget {
  final MessageFirebase message;

  const ItemConversation({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMe =
        message.user == context.read<SessionBloc>().state.user!.id;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isMe ? 'Me'.toUpperCase() : context.read<UserBloc>().state.entity!.pseudo,
          style: TextStyle(
            color: isMe ? Colors.red : Colors.blueAccent,
            fontSize: 12,
          ),
        ),
        IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                Container(
                  color: isMe ? Colors.red : Colors.blueAccent,
                  width: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(message.text),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
