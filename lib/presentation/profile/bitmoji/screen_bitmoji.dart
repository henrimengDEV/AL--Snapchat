import 'package:final_flutter_project/domain/user/user.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/profile/bitmoji/body_bitmoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermoji/fluttermoji.dart';

class ScreenBitmoji extends StatelessWidget {
  static const routeName = 'screen_bitmoji';

  const ScreenBitmoji({Key? key}) : super(key: key);

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
    // sessionState.add(
    //   SetUser(sessionState.state.user!.copyWith(avatar: localBitmoji)),
    // );
  }
}
