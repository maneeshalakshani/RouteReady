import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

Future<void> requestCameraPermission() async {
  var status = await Permission.camera.request();
  if (status.isGranted) {
    log('Permission: Granted');
  } else {
    // Permission denied.
    log('Permission: Not-Granted');
  }
}

Future<void> checkCameraPermission() async {
  var status = await Permission.camera.status;
  if (status.isDenied) {
    requestCameraPermission();
  }
}
