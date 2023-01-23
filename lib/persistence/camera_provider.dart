import 'package:async/async.dart';
import 'package:camera/camera.dart';

class CameraProvider {

  // Singleton pattern
  static final CameraProvider _cameraProvider = new CameraProvider._internal();
  CameraProvider._internal();
  static CameraProvider get instance => _cameraProvider;

  // Members
  static List<CameraDescription> _cameras = [];
  final _initCameraProvider = AsyncMemoizer<List<CameraDescription>>();

  List<CameraDescription> get cameras {
    if (_cameras.isNotEmpty) {
      return _cameras;
    }

    return _cameras;
  }

  Future<void> init()  async {
    _cameras = await _initCameraProvider.runOnce(() async {
      return await availableCameras();
    });
  }
}
