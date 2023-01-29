import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/presentation/conversation/screen_conversation.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemChat extends StatelessWidget {
  final User item;

  static ButtonStyle buttonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.black),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    ),
  );

  const ItemChat({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScreenConversation()),
        )
      },
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

  Widget _getAvatar(context) {
    if (item.avatar == null) {
      return SvgPicture.defaultPlaceholderBuilder(context);
    }

    return SnapAvatar(avatar: item.avatar!);
  }
}
