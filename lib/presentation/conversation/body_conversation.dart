import 'package:final_flutter_project/presentation/conversation/feed_conversation.dart';
import 'package:flutter/cupertino.dart';

import 'footer_conversation.dart';
import 'header_conversation.dart';

class BodyConversation extends StatelessWidget {
  const BodyConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HeaderConversation(),
          FeedConversation(),
          FooterConversation(),
        ],
      ),
    );
  }
}
