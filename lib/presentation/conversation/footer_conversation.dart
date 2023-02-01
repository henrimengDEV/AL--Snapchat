import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/shared/snap_icon.dart';
import 'package:final_flutter_project/presentation/shared/snap_text_field_rounded.dart';
import 'package:flutter/material.dart';

class FooterConversation extends StatelessWidget {
  const FooterConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => FileUtils.goTo(context, ScreenCamera.routeName),
              child: const SnapIcon(icon: Icons.camera_alt),
            ),
            const SizedBox(width: 5),
            const Expanded(child: SnapTextFieldRounded()),
            const SizedBox(width: 5),
            Wrap(
              spacing: 15,
              children: const [
                Icon(Icons.account_circle_outlined),
                Icon(Icons.photo_library_outlined),
                Icon(Icons.rocket_launch_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
