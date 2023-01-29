import 'package:flutter/cupertino.dart';

class ItemConversation extends StatelessWidget {
  const ItemConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nom"),
          Row(
            children: [
              Text(" | "),
              Text("MESSAGES"),
            ],
          ),
        ],
      ),
    );
  }
}
