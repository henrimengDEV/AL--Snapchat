import 'package:flutter/material.dart';

class FloatingTopRightActionsCamera extends StatelessWidget {
  static const double sizeElements = 30;

  const FloatingTopRightActionsCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 10,
            children: [
              const Icon(
                Icons.account_circle,
                size: sizeElements,
                color: Colors.white,
              ),
              Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: const [
                  Icon(
                    Icons.emoji_objects_outlined,
                    size: sizeElements,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.bolt,
                    size: sizeElements,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: sizeElements,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
