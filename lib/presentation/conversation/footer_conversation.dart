import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterConversation extends StatelessWidget {
  const FooterConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          children: const [
            Text("Appareil photo  "),
            SizedBox(width: 5),
            Expanded(child: CupertinoTextField()),
            SizedBox(width: 5),
            Text("Icones.....  "),
          ],
        ),
      ),
    );
  }
}
