import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';

class SnapAvatar extends StatelessWidget {
  final String avatar;

  const SnapAvatar({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
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
