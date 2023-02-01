import 'package:final_flutter_project/presentation/shared/snap_text_field.dart';
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
    Navigator.of(context).pushNamed(ScreenBirthday.routeName);
  }
}
