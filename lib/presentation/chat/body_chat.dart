import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';

class BodyChat extends StatelessWidget {

  const BodyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
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
      ),
    );
  }
}
