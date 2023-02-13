import 'package:final_flutter_project/presentation/shared/pill_button.dart';
import 'package:flutter/material.dart';

class TileSuggestionStory extends StatelessWidget {
  final String name;

  const TileSuggestionStory({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/snapchat_anonymous.png',
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 17),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 18),
              ),
              const Text(
                "Recently joined",
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(width: 50),
          const PillButton(label: "Add", icon: Icons.add),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}
