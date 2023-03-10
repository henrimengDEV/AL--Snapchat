import 'package:final_flutter_project/domain/user/user.dart';
import 'package:final_flutter_project/presentation/map/body_map.dart';
import 'package:final_flutter_project/presentation/shared/snap_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class ScreenMap extends StatelessWidget {
  static const routeName = 'screen_map';

  const ScreenMap({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyMap(),
      bottomNavigationBar: SnapBottomBar(routeActivated: routeName),
    );
  }

  String getBitmoji(User last) {
    if (last.avatar != null) {
      return FluttermojiFunctions().decodeFluttermojifromString(last.avatar!);
    }

    return "";
  }
}
