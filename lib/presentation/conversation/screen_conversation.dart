import 'package:final_flutter_project/presentation/conversation/body_conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenConversation extends StatelessWidget {
  const ScreenConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyConversation(),
    );

  }
}
