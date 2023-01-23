import 'package:final_flutter_project/presentation/camera/screen_camera.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goBack(context),
          child: const Text('404 NOT FOUND'),
        ),
      ),
    );
  }

  _goBack(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenCamera.routeName);
  }
}
