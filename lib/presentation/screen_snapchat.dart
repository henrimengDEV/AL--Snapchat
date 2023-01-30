import 'package:final_flutter_project/presentation/login/screen_sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'camera/screen_camera.dart';
import 'login/screen_login.dart';

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
                child: Image.asset('assets/images/snapchat.png', height: 150, width: 150),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => _goBack(context), child: Text("SKIP")),
                ElevatedButton(onPressed: () => _goLogin(context), child: Text("Log In")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () => _goSignup(context), child: Text("Sign Up")),
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScreenLogin()),
    );
  }
  _goSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScreenSignUp())
    );
  }
}
