import 'package:final_flutter_project/presentation/login/screen_birthday.dart';
import 'package:flutter/material.dart';

import 'form_sign_up.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Expanded(child: FormSignUp()),
              ElevatedButton(
                  onPressed: () => {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ScreenBirthday()))
                  },
                  child: const Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}
