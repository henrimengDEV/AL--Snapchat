import 'package:final_flutter_project/presentation/shared/snap_icon.dart';
import 'package:flutter/material.dart';

class HeaderChat extends StatelessWidget {
  const HeaderChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SnapIcon(icon: Icons.account_circle),
        ),
        SnapIcon(icon: Icons.search),
        Expanded(
          child: Center(
            child: Text(
              'Chat',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SnapIcon(icon: Icons.add),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SnapIcon(icon: Icons.edit),
        ),
      ],
    );
  }
}
