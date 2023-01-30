import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormBirthday extends StatelessWidget {
  const FormBirthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Center(
          child: Text(
            "What's your birthday ?",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "BIRTHDAY",
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        SizedBox(height: 5),
        CupertinoTextField(placeholder: "BIRTHDAY"),
      ],
    );
  }
}
