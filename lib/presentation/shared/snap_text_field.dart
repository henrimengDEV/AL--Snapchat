import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnapTextField extends StatelessWidget {
  final TextEditingController textController;
  final bool obscure;
  final String label;
  final void Function(String)? onChange;

  const SnapTextField({
    Key? key,
    required this.textController,
    required this.label,
    required this.obscure,
    this.onChange,
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
        Column(
          children: [
            TextField(
              controller: textController,
              onChanged: onChange,
              obscureText: obscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
                contentPadding: const EdgeInsets.all(0),
                // hintText: label,
                hintStyle: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(color: Colors.black, height: 5, width: 1),
                Expanded(child: Container(color: Colors.black, height: 1)),
                Container(color: Colors.black, height: 5, width: 1),
              ],
            )
          ],
        ),
      ],
    );
  }
}
