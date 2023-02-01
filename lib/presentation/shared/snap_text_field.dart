import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnapTextField extends StatelessWidget {
  final TextEditingController textController;
  final bool obscure;
  final String label;

  SnapTextField({
    Key? key,
    required this.textController,
    required this.label,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        ),
        const SizedBox(height: 5),
        CupertinoTextField(
          obscureText: obscure,
          obscuringCharacter: '*',
          placeholder: label,
          controller: textController,
        ),
        TextField(
          obscureText: obscure,
          obscuringCharacter: '*',
          controller: textController,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            )
          ),
        )
      ],
    );
  }
}
