import 'package:flutter/material.dart';

class SnapIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const SnapIcon({
    Key? key,
    required this.icon,
    this.size = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(50)),
      child: Icon(icon),
    );
  }
}
