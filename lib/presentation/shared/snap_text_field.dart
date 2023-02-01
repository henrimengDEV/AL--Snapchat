import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnapTextField extends StatefulWidget {
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
  State<SnapTextField> createState() => _SnapTextFieldState();
}

class _SnapTextFieldState extends State<SnapTextField> {
  

  @override
  void initState(){
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        ),
        TextField(
          obscureText: widget.obscure,
          obscuringCharacter: '*',
          controller: widget.textController,
          decoration: InputDecoration(
            suffixIcon: widget.obscure? const Icon(CupertinoIcons.eye_slash) : const Icon(CupertinoIcons.eye),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            contentPadding: const EdgeInsets.all(0),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(color: Colors.black, height: 5, width: 1),
            Expanded(child: Container(color: Colors.black, height: 1)),
            Container(color: Colors.black, height: 5, width: 1),
          ],
        ),
      ],
    );
  }
}
