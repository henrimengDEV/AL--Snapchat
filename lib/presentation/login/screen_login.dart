import 'package:flutter/material.dart';

import '../camera/screen_camera.dart';
import 'form_login.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(child: FormLogin()),
              ElevatedButton(onPressed: () => {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenCamera()),
              )
              }, child: Text("Log In")),
            ],
          ),
        ),
      ),
    );
  }

}
