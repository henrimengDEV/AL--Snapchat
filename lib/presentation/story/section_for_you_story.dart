import 'package:final_flutter_project/presentation/shared/snap_title.dart';
import 'package:flutter/material.dart';

import 'item_for_you_story.dart';

class SectionForYouStory extends StatelessWidget {
  final List<String> images = [
    "assets/images/snapchat_story_1.png",
    "assets/images/snapchat_story_2.png",
    "assets/images/snapchat_story_2.png",
    "assets/images/snapchat_story_1.png",
    "assets/images/snapchat_story_1.png",
    "assets/images/snapchat_story_2.png",
  ];

  SectionForYouStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            SnapTitle(text: "For you"),
          ],
        ),
        const SizedBox(height: 13),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) =>
              ItemForYouStory(name: images[index]),
          itemCount: images.length,
        )
      ],
    );
  }
}
