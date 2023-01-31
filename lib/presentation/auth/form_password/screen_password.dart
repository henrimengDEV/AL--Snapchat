import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:final_flutter_project/presentation/shared/snap_text_field.dart';
import 'package:flutter/material.dart';


class ScreenPassword extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  static const routeName = 'screen_password';

  ScreenPassword({Key? key}) : super(key: key);

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
                      "Set a password",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SnapTextField(
                    // title: "Set a password",
                    label: "PASSWORD",
                    textController: passwordController,
                    obscure: true,
                  ),
                  // FormUsername(usernameController: usernameController)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => _goToCamera(context),
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
                    "Continue",
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

  _goToCamera(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenCamera.routeName);
    print(passwordController.text);
  }
}
