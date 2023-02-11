import 'package:final_flutter_project/presentation/shared/snap_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderStory extends StatelessWidget {
  const HeaderStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SnapIcon(icon: Icons.account_circle),
        SizedBox(width: 10),
        SnapIcon(icon: Icons.search),
        Expanded(
          child: Center(
            child: Text(
              'Story',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SnapIcon(icon: CupertinoIcons.person_crop_circle_fill_badge_plus),
        SizedBox(width: 10),
        SnapIcon(icon: Icons.more_horiz),
      ],
    );
  }
}
