import 'package:flutter/material.dart';

class HeaderChat extends StatelessWidget {
  const HeaderChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle),
        ),
        Icon(Icons.search),
        Expanded(child: Center(child: Text('Chat'))),
        Icon(Icons.add),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.edit),
        ),
      ],
    );
  }
}
