import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

class BodyBitmoji extends StatelessWidget {
  const BodyBitmoji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(child: FluttermojiCircleAvatar()),
              FluttermojiCustomizer(),
            ],
          )
        ],
      ),
    );
  }
}
