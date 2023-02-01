import 'package:flutter/material.dart';

class SnapGroupIcons extends StatelessWidget {
  final List<Icon> icons;

  const SnapGroupIcons({
    Key? key,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(25)),
      child: Wrap(
        spacing: 5,
        children: icons,
      ),
    );
  }
}
