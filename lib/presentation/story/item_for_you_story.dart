import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemForYouStory extends StatelessWidget {
  final String name;

  const ItemForYouStory({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Image.asset(
        name,
        fit: BoxFit.fill,
      ),
    );
  }
}
