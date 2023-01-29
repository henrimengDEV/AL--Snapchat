import 'package:final_flutter_project/presentation/shared/snap_bottom_bar.dart';
import 'package:final_flutter_project/presentation/story/body_story.dart';
import 'package:flutter/material.dart';

class ScreenStory extends StatelessWidget {
  static const routeName = 'screen_story';

  const ScreenStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyStory(),
      bottomNavigationBar: SnapBottomBar(routeActivated: routeName)
    );
  }
}
