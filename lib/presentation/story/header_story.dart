import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/presentation/profile/screen_profile.dart';
import 'package:final_flutter_project/presentation/shared/modal/friends_modal/friends_modal.dart';
import 'package:final_flutter_project/presentation/shared/snap_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderStory extends StatelessWidget {
  const HeaderStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SnapIcon(
          icon: Icons.account_circle,
          onPressed: () => FileUtils.goTo(context, ScreenProfile.routeName),
        ),
        const SizedBox(width: 10),
        const SnapIcon(icon: Icons.search),
        const Expanded(
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
        SnapIcon(
          icon: CupertinoIcons.person_crop_circle_fill_badge_plus,
          onPressed: () => FriendsModal.showIt(context),
        ),
        const SizedBox(width: 10),
        const SnapIcon(icon: Icons.more_horiz),
      ],
    );
  }
}
