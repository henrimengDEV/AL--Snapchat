import 'package:final_flutter_project/presentation/profile/body_profile.dart';
import 'package:final_flutter_project/presentation/shared/snap_bottom_bar.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  static const routeName = 'screen_profile';

  const ScreenProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProfile(),
      bottomNavigationBar: SnapBottomBar(routeActivated: routeName),
    );
  }
}
