import 'package:final_flutter_project/domain/firebase/conversation_firebase.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/persistence/conversation/conversation_bloc.dart';
import 'package:final_flutter_project/presentation/conversation/screen_conversation.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../persistence/user/user_bloc.dart';

class ItemChat extends StatelessWidget {
  final UserFirebase item;
  final ConversationFirebase conversationFirebase;

  const ItemChat({
    Key? key,
    required this.item,
    required this.conversationFirebase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _goToScreenConversation(context),
      style: buttonStyle,
      child: Row(
        children: [
          _getAvatar(context),
          Expanded(
            child: Text(
              item.pseudo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(Icons.messenger_outline),
        ],
      ),
    );
  }

  static ButtonStyle buttonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.black),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    ),
  );

  _goToScreenConversation(BuildContext context) {
    context.read<UserBloc>().add(UpdateUser(userFirebase: item));
    context.read<ConversationBloc>().add(UpdateConversation(
          conversationFirebase: conversationFirebase,
        ));
    Navigator.of(context).pushNamed(ScreenConversation.routeName);
  }

  Widget _getAvatar(context) {
    if (item.avatar == null) {
      return SvgPicture.defaultPlaceholderBuilder(context);
    }

    return SnapAvatar(avatar: item.avatar);
  }
}
