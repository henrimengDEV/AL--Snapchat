import 'package:flutter/material.dart';

class FloatingBottomActionsCamera extends StatelessWidget {
  static const double sizeSideElements = 30;

  const FloatingBottomActionsCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 5,
          children: const [
            Icon(
              Icons.photo_library_outlined,
              size: sizeSideElements,
              color: Colors.white,
            ),
            Icon(
              Icons.circle_outlined,
              size: 100,
              color: Colors.white,
            ),
            Icon(
              Icons.emoji_emotions_outlined,
              size: sizeSideElements,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
