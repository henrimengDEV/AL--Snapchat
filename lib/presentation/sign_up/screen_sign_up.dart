import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Text("Bonjour")),
          ],
        ),
      ),
    );
  }
}
