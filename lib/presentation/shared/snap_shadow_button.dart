import 'package:flutter/material.dart';

class SnapShadowButton extends StatelessWidget {
  final String label;
  final IconData leadingIcon;
  final Function()? onPress;

  static BoxDecoration buttonDecoration = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        offset: const Offset(0, 3),
      ),
    ],
  );

  const SnapShadowButton({
    Key? key,
    required this.label,
    this.leadingIcon = Icons.phone_android_outlined,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: buttonDecoration,
        child: Row(
          children: [
            Icon(leadingIcon),
            const SizedBox(width: 20),
            Expanded(child: Text(label)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
