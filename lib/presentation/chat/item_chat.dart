import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:flutter/material.dart';

class ItemChat extends StatelessWidget {
  final User item;

  const ItemChat({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SnapAvatar(avatar: item.avatar!),
          const SizedBox(width: 10),
          Text(item.pseudo),
        ],
      ),
    );
  }
}
