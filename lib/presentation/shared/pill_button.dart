import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function? onPressed;

  const PillButton({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        label,
        style: const TextStyle(color: Colors.black),
      ),
      icon: Icon(
        icon,
        size: 15,
        color: Colors.purple,
      ),
      onPressed: () {
        onPressed?.call();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 0,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.black12),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
