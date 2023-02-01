import 'package:flutter/material.dart';

class FileUtils {
  static goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  static goTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}