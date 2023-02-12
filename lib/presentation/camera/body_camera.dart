import 'package:camera/camera.dart';
import 'package:final_flutter_project/persistence/provider/camera_provider.dart';
import 'package:final_flutter_project/presentation/camera/floating_bottom_actions_camera.dart';
import 'package:final_flutter_project/presentation/camera/floating_top_left_actions_camera.dart';
import 'package:final_flutter_project/presentation/camera/floating_top_right_actions_camera.dart';
import 'package:final_flutter_project/presentation/shared/container_fluid.dart';
import 'package:flutter/material.dart';

// class BodyCamera extends StatefulWidget {
//   const BodyCamera({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<BodyCamera> createState() => _BodyCameraState();
// }
//
// class _BodyCameraState extends State<BodyCamera> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     asyncInit();
//   }
//
//   asyncInit() {
//     _controller = CameraController(
//       CameraProvider.instance.firstCamera!,
//       ResolutionPreset.veryHigh,
//     );
//
//     _initializeControllerFuture = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ContainerFluid(
//       child: Stack(
//         children: [
//           previewCamera(),
//           const FloatingTopLeftActionsCamera(),
//           const FloatingTopRightActionsCamera(),
//           const FloatingBottomActionsCamera(),
//         ],
//       ),
//     );
//   }
//
//   Widget previewCamera() {
//     return FutureBuilder<void>(
//       future: _initializeControllerFuture,
//       builder: (context, snapshot) {
//         if (
//             snapshot.connectionState == ConnectionState.done ||
//             _initializeControllerFuture == null
//         ) {
//           return SizedBox(
//             height: double.infinity,
//             width: double.infinity,
//             child: CameraPreview(_controller),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

class BodyCamera extends StatefulWidget {
  const BodyCamera({Key? key}) : super(key: key);

  @override
  State<BodyCamera> createState() => _BodyCameraState();
}

class _BodyCameraState extends State<BodyCamera> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('de la merde'),);
  }
}

