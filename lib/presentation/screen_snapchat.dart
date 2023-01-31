import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth/login/screen_login.dart';
import 'auth/sign_up/screen_sign_up.dart';
import 'camera/screen_camera.dart';

class ScreenSnapchat extends StatelessWidget {
  const ScreenSnapchat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset('assets/images/snapchat.png',
                    height: 150, width: 150),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _goLogin(context),
                  style: ButtonStyle(
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
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _goSignup(context),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _goBack(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenCamera.routeName);
  }

  _goLogin(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenLogin.routeName);
  }

  _goSignup(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenSignUp.routeName);
  }
}
