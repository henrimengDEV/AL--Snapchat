import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/profile/bitmoji/body_bitmoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermoji/fluttermoji.dart';

class ScreenBitmoji extends StatefulWidget {
  static const routeName = 'screen_bitmoji';

  const ScreenBitmoji({Key? key}) : super(key: key);

  @override
  State<ScreenBitmoji> createState() => _ScreenBitmojiState();
}

class _ScreenBitmojiState extends State<ScreenBitmoji> {

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

  asyncInit() async {
    await FluttermojiFunctions().clearFluttermoji();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom your avatar',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => setAvatar(context),
            child: const Text('save'),
          ),
        ],
      ),
      body: const BodyBitmoji(),
    );
  }

  void setAvatar(BuildContext context) async {
    String localBitmoji = await FluttermojiFunctions().encodeMySVGtoString();
    SessionBloc sessionState = context.read<SessionBloc>();
    FirebaseFirestore.instance
        .collection("users")
        .doc(sessionState.state.user!.id)
        .update({'avatar': localBitmoji}).then((value) => print('EZAEZA'));
  }
}
