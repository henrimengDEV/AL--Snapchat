import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/chat/screen_chat.dart';
import 'package:final_flutter_project/presentation/map/screen_map.dart';
import 'package:final_flutter_project/presentation/profile/screen_profile.dart';
import 'package:final_flutter_project/presentation/story/screen_story.dart';
import 'package:flutter/material.dart';

class SnapBottomBarItem {
  final String routeName;
  final Widget icon;
  final Widget selectedIcon;


  const SnapBottomBarItem({
    required this.routeName,
    required this.icon,
    required this.selectedIcon,
  });
}

class SnapBottomBar extends StatelessWidget {
  final String routeActivated;
  static const List<SnapBottomBarItem> items = [
    SnapBottomBarItem(
      routeName: ScreenMap.routeName,
      icon: Icon(Icons.pin_drop_outlined),
      selectedIcon: Icon(Icons.pin_drop),
    ),
    SnapBottomBarItem(
      routeName: ScreenChat.routeName,
      icon: Icon(Icons.message_outlined),
      selectedIcon: Icon(Icons.message),
    ),
    SnapBottomBarItem(
      routeName: ScreenCamera.routeName,
      icon: Icon(Icons.camera_alt),
      selectedIcon: Icon(Icons.camera_alt),
    ),
    SnapBottomBarItem(
      routeName: ScreenStory.routeName,
      icon: Icon(Icons.play_arrow_outlined),
      selectedIcon: Icon(Icons.play_arrow),
    ),
    SnapBottomBarItem(
      routeName: ScreenProfile.routeName,
      icon: Icon(Icons.accessibility),
      selectedIcon: Icon(Icons.settings_accessibility),
    ),
  ];

  const SnapBottomBar({
    Key? key,
    required this.routeActivated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: items
            .map(
              (item) =>
              Expanded(
                child: IconButton(
                  splashRadius: 20,
                  onPressed: () => _goTo(context, item.routeName),
                  icon: item.icon,
                  selectedIcon: item.selectedIcon,
                  isSelected: item.routeName == routeActivated,
                ),
              ),
        )
            .toList(),
      ),
    );
  }

  _goTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}
