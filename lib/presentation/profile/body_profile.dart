import 'package:final_flutter_project/domain/user.dart';
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
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     color: Colors.black38,
          //     width: double.infinity,
          //     height: double.infinity,
          //     child: const CupertinoAlertDialog(
          //       title: Text('Modification detected'),
          //       content: Text('Do you want to save your new Avatar ?'),
          //       actions: [
          //         CupertinoDialogAction(child: Text('No')),
          //         CupertinoDialogAction(child: Text('Yes')),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void setAvatar(BuildContext context) async {
    String localBitmoji = await FluttermojiFunctions().encodeMySVGtoString();
    context.read<UserCubit>().add(User(
          id: 1,
          avatar: localBitmoji,
          pseudo: 'Henri',
        ));
  }
}
