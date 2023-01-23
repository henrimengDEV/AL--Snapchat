import 'package:final_flutter_project/presentation/chat/body_chat.dart';
import 'package:final_flutter_project/presentation/shared/snap_bottom_bar.dart';
import 'package:flutter/material.dart';

class ScreenChat extends StatelessWidget {
  static const routeName = 'screen_chat';

  const ScreenChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyChat(),
      bottomNavigationBar: SnapBottomBar(routeActivated: routeName),
    );
  }
}
