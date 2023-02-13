import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/firebase/user_firebase.dart';
import 'package:final_flutter_project/presentation/auth/sign_up/page_confirm_sign_up.dart';
import 'package:final_flutter_project/presentation/auth/sign_up/page_password_sign_up.dart';
import 'package:final_flutter_project/presentation/auth/sign_up/page_username_sign_up.dart';
import 'package:final_flutter_project/presentation/profile/bitmoji/body_bitmoji.dart';
import 'package:final_flutter_project/presentation/screen_snapchat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiFunctions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page_birthday_sign_up.dart';

class ScreenSignUp extends StatefulWidget {
  static const routeName = 'screen_sign_up';

  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final PageController pageViewController = PageController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String username = "";
  DateTime birthday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageViewController,
                  children: [
                    PageUsernameSignUp(
                      usernameController: usernameController,
                      onUsernameChange: onUsernameChange,
                    ),
                    PageCredentialSignUp(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    PageBirthdaySignUp(
                      onSelectedDateChange: onSelectedBirthdayChange,
                    ),
                    const BodyBitmoji(),
                    PageConfirmSignUp(
                      username: usernameController.text,
                      cancelForm: cancelForm,
                      validForm: validForm,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SmoothPageIndicator(
                controller: pageViewController,
                count: 5,
                effect: const WormEffect(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSelectedBirthdayChange(DateTime dateTime) {
    setState(() {
      birthday = dateTime;
    });
  }

  onUsernameChange(String username) {
    setState(() {
      username = username;
    });
  }

  cancelForm() {
    print('cancelForm');
    // FluttermojiFunctions().decodeFluttermojifromString(MockUser.defaultAvatar);
    Navigator.of(context).pushNamed(ScreenSnapchat.routeName);
  }

  Future<void> validForm() async {
    print(emailController.text);
    print(passwordController.text);
    print(usernameController.text);
    print(birthday);
    String localBitmoji = await FluttermojiFunctions().encodeMySVGtoString();

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) {
      FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set(
            UserFirebase(
              id: value.user!.uid,
              avatar: localBitmoji,
              pseudo: usernameController.text,
              createAt: DateTime.now(),
            ).toJson(),
          );
    }).then(
      (value) => Navigator.of(context).pushNamed(PageBirthdaySignUp.routeName),
    );
  }
}
