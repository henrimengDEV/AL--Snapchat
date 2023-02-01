import 'package:flutter/material.dart';

class SnapTextFieldRounded extends StatelessWidget {
  const SnapTextFieldRounded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50)),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        hintText: 'Chat',
        suffixIcon: const Icon(Icons.mic),
      ),
    );
  }
}
