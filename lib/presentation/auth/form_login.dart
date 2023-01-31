import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Center(
          child: Text(
            "Log In",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "USERNAME",
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        SizedBox(height: 5),
        CupertinoTextField(placeholder: "USERNAME"),
        SizedBox(height: 10),
        Text(
          "PASSWORD",
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        SizedBox(height: 5),
        CupertinoTextField(placeholder: "PASSWORD"),
      ],
    );
  }
}
