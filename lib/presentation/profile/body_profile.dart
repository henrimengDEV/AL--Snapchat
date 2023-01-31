import 'package:final_flutter_project/domain/user.dart';
import 'package:final_flutter_project/persistence/store/store_cubit.dart';
import 'package:final_flutter_project/persistence/store/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermoji/fluttermoji.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const Text(
                'Custom your avatar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              const Divider(),
              Expanded(child: FluttermojiCircleAvatar()),
              FluttermojiCustomizer(),
            ],
          ),
          ElevatedButton(
            onPressed: () => setAvatar(context),
            child: Text('save'),
          ),
        ],
      ),
    );
  }

  void setAvatar(BuildContext context) async {
    String localBitmoji = await FluttermojiFunctions().encodeMySVGtoString();
    context.read<StoreCubit>().addUser(User(
          id: 1,
          avatar: localBitmoji,
          pseudo: 'Henri',

        ));
  }
}
