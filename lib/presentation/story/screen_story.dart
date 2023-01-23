import 'package:final_flutter_project/presentation/shared/snap_bottom_bar.dart';
import 'package:flutter/material.dart';

class ScreenStory extends StatelessWidget {
  static const routeName = 'screen_story';

  const ScreenStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.cyan)),
          Container(height: 50, color: Colors.blue),
        ],
      ),
      bottomNavigationBar: const SnapBottomBar(routeActivated: routeName)
    );
  }
}
