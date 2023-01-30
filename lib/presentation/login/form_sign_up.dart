import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Center(
          child: Text(
            "What's your name ?",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "FIRST NAME",
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        SizedBox(height: 5),
        CupertinoTextField(placeholder: "FIRST NAME"),
        SizedBox(height: 10),
        Text(
          "LAST NAME",
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        SizedBox(height: 5),
        CupertinoTextField(placeholder: "LAST NAME"),
      ],
    );
  }
}
