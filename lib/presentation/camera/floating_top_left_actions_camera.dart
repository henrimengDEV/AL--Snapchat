import 'package:flutter/material.dart';

class FloatingTopLeftActionsCamera extends StatelessWidget {
  static const double sizeElements = 30;

  const FloatingTopLeftActionsCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: const [
              Icon(
                Icons.account_circle,
                size: sizeElements,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                size: sizeElements,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
