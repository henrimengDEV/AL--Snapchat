import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';

class SnapAvatar extends StatelessWidget {
  final String avatar;
  final double size;

  const SnapAvatar({
    Key? key,
    required this.avatar,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.string(
        FluttermojiFunctions().decodeFluttermojifromString(avatar),
      ),
    );
  }
}
