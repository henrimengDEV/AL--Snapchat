import 'package:flutter/cupertino.dart';

class HeaderConversation extends StatelessWidget {

  const HeaderConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(

          children: [
            Text("Avatar"),
            SizedBox(width: 5),
            Expanded(child: Text("Pseudo")),
            Text("icone "),
            Text("icone "),
            Text("retour "),
          ],

        ),
      ),
    );
  }
}
