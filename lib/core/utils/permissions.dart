import 'package:permission_handler/permission_handler.dart';

class Permissions {
  static Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.request();
    return status.isGranted;
  }

  static Future<bool> requestMicrophonePermission() async {
    var status = await Permission.microphone.request();
    return status.isGranted;
  }
}
