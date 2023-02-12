import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/file_utils.dart';
import 'package:final_flutter_project/persistence/session/session_bloc.dart';
import 'package:final_flutter_project/presentation/shared/snap_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../camera/screen_camera.dart';

class ScreenLogin extends StatelessWidget {
  static const routeName = 'screen_login';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SnapTextField(
                    textController: usernameController,
                    label: "USERNAME",
                    obscure: false,
                  ),
                  SnapTextField(
                    textController: passwordController,
                    label: "PASSWORD",
                    obscure: true,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => _onLogInClick(context),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onLogInClick(BuildContext context) {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      )
          .then(
        (value) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(value.user!.uid)
              .snapshots()
              .map((event) => UserFirebase.fromJson(event.data()!))
              .first
              .then(
            (user) {
              context.read<SessionBloc>().add(LogIn(user: user));
              FileUtils.goTo(context, ScreenCamera.routeName);
            },
          );
        },
      );
    } catch (e) {
      print('error :');
    }
  }
}
