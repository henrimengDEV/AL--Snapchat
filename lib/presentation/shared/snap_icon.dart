import 'package:flutter/material.dart';

class SnapIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final void Function()? onPressed;

  const SnapIcon({
    Key? key,
    required this.icon,
    this.size = 6,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon),
        splashRadius: 20,
        onPressed: onPressed,
      ),
    );
  }
}
