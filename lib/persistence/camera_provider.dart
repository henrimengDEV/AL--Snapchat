import 'package:camera/camera.dart';

class CameraProvider {
  late CameraDescription firstCamera;
  static final CameraProvider _instance = CameraProvider._internal();

  CameraProvider._internal();

  static CameraProvider get instance => _instance;
}