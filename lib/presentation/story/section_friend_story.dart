import 'package:final_flutter_project/presentation/shared/pill_button.dart';
import 'package:final_flutter_project/presentation/shared/snap_title.dart';
import 'package:final_flutter_project/presentation/story/item_story.dart';
import 'package:flutter/cupertino.dart';

class SectionFriendStory extends StatelessWidget {
  final List<String> stories = [
    "Bruce",
    "Selena",
    "jennifer",
    "Jack",
    "Teemo",
    "Paul",
  ];

  SectionFriendStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: const [
              SnapTitle(text: "Friends"),
              Spacer(),
              PillButton(icon: CupertinoIcons.add, label: "My Story"),
            ],
          ),
          const SizedBox(height: 13),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10,
              children: stories.map((e) => ItemStory(name: e)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
