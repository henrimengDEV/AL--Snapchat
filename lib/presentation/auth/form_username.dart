import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormUsername extends StatelessWidget {

  final TextEditingController usernameController;

  FormUsername({Key? key, required this.usernameController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Your Username",
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
        CupertinoTextField(placeholder: "USERNAME", controller: usernameController),
      ],
    );
  }
}
