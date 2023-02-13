import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/persistence/user/user_bloc.dart';
import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/shared/snap_avatar.dart';
import 'package:final_flutter_project/presentation/shared/snap_group_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderConversation extends StatelessWidget {
  const HeaderConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                SnapAvatar(
                  avatar: state.entity!.avatar,
                  size: 45,
                ),
                const SizedBox(width: 5),
                Expanded(child: Text(state.entity!.pseudo)),
                GestureDetector(
                  onTap: () => FileUtils.goTo(context, ScreenCamera.routeName),
                  child: const SnapGroupIcons(icons: [
                    Icon(Icons.phone),
                    Icon(Icons.video_camera_front_rounded),
                  ]),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => FileUtils.goBack(context),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
