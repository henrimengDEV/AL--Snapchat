import 'package:final_flutter_project/presentation/story/header_story.dart';
import 'package:final_flutter_project/presentation/story/section_for_you_story.dart';
import 'package:final_flutter_project/presentation/story/section_friend_story.dart';
import 'package:final_flutter_project/presentation/story/section_quick_add_story.dart';
import 'package:flutter/material.dart';

class BodyStory extends StatefulWidget {
  const BodyStory({super.key});

  @override
  State<BodyStory> createState() => _BodyStoryState();
}

class _BodyStoryState extends State<BodyStory> {
  final double gap = 15;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderStory(),
              SizedBox(height: gap),
              SectionFriendStory(),
              SizedBox(height: gap),
              SectionQuickAddStory(),
              SizedBox(height: gap),
              SectionForYouStory(),
            ],
          ),
        ),
      ),
    );
  }
}
