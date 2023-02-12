import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/common/mock_user.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/domain/user/user.dart';
import 'package:final_flutter_project/presentation/shared/snap_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../form_birthday/screen_birthday.dart';

class ScreenSignUp extends StatelessWidget {
  static const routeName = 'screen_sign_up';
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  ScreenSignUp({Key? key}) : super(key: key);

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
                      "What's your name ?",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SnapTextField(
                    textController: firstNameController,
                    label: "FIRST NAME",
                    obscure: false,
                  ),
                  SnapTextField(
                    textController: lastNameController,
                    label: "LAST NAME",
                    obscure: false,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => _goToBirthday(context),
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
                    "Sign Up",
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

  _goToBirthday(BuildContext context) {
    // FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //   email: 'henri@mail.com',
    //   password: 'pouetpouet',
    // )
    //     .then((value) {
    //   FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set(
    //         UserFirebase(
    //           id: value.user!.uid,
    //           avatar: MockUser.defaultAvatar,
    //           pseudo: 'henri@mail.com',
    //           createAt: DateTime.now(),
    //         ).toJson(),
    //       );
    // });
    Navigator.of(context).pushNamed(ScreenBirthday.routeName);
  }
}
