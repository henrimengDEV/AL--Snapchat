import 'package:final_flutter_project/presentation/camera/body_camera.dart';
import 'package:final_flutter_project/presentation/shared/snap_bottom_bar.dart';
import 'package:flutter/material.dart';

class ScreenCamera extends StatelessWidget {
  static const routeName = 'screen_camera';

  const ScreenCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BodyCamera(),
        bottomNavigationBar: SnapBottomBar(routeActivated: routeName));
  }
}
