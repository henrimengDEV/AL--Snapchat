import 'package:final_flutter_project/presentation/shared/snap_title.dart';
import 'package:final_flutter_project/presentation/story/tile_suggestion_story.dart';
import 'package:flutter/cupertino.dart';

class SectionQuickAddStory extends StatelessWidget {
  final List<String> suggestions = [
    "jeff buzz",
    "Ruby",
    "Paul",
    "Paulita",
  ];

  SectionQuickAddStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: const [
              SnapTitle(text: "Quick Add"),
            ],
          ),
          const SizedBox(height: 13),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10,
              children: suggestions.map((e) => TileSuggestionStory(name: e)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
