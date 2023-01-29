import 'package:final_flutter_project/presentation/conversation/item_conversation.dart';
import 'package:flutter/cupertino.dart';

class FeedConversation extends StatelessWidget {
  const FeedConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: SafeArea(
          child: ItemConversation(),
        ),
      ),
    );
  }
}
