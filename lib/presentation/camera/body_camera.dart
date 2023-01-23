import 'package:camera/camera.dart';
import 'package:final_flutter_project/persistence/camera_provider.dart';
import 'package:final_flutter_project/presentation/camera/floating_bottom_actions_camera.dart';
import 'package:final_flutter_project/presentation/camera/floating_top_left_actions_camera.dart';
import 'package:final_flutter_project/presentation/camera/floating_top_right_actions_camera.dart';
import 'package:final_flutter_project/presentation/shared/container_fluid.dart';
import 'package:flutter/material.dart';

class BodyCamera extends StatefulWidget {
  const BodyCamera({Key? key}) : super(key: key);

  @override
  State<BodyCamera> createState() => _BodyCameraState();
}

class _BodyCameraState extends State<BodyCamera> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _cameras = CameraProvider.instance.cameras;
    if (_cameras.isEmpty) return;
    _controller = CameraController(
      _cameras[0],
      ResolutionPreset.max,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerFluid(
      child: Stack(
        children: [
          previewCamera(),
          const FloatingTopLeftActionsCamera(),
          const FloatingTopRightActionsCamera(),
          const FloatingBottomActionsCamera(),
        ],
      ),
    );
  }

  Widget previewCamera() {
    if (_cameras.isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black87,
      );
    }

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CameraPreview(_controller),
    );
  }
}
