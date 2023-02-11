import 'package:flutter/material.dart';

class ItemStory extends StatelessWidget {
  final double sizeBorder = 82;
  final double sizeImg = 68;
  final String name;

  const ItemStory({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: sizeBorder,
          width: sizeBorder,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 4,
              color: const Color.fromRGBO(200, 55, 171, 1),
            ),
          ),
          child: Container(
            height: sizeBorder,
            width: sizeBorder,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: const Color.fromRGBO(196, 196, 196, 1),
              ),
            ),
            child: Image.asset(
              'assets/images/snapchat_story.png',
              height: sizeImg,
              width: sizeImg,
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
