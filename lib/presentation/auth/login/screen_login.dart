import 'package:final_flutter_project/presentation/shared/snap_text_field.dart';
import 'package:flutter/material.dart';

import '../../camera/screen_camera.dart';

class ScreenLogin extends StatelessWidget {
  static const routeName = 'screen_login';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  _goToCamera(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenCamera.routeName);
  }
}
