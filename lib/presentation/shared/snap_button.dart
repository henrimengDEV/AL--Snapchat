import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnapButton extends StatelessWidget {

  final String name;
  final Function test;

  const SnapButton({Key? key, required this.test, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => test,
      child: Text(name),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )
          )
      ),
    );
  }
}
