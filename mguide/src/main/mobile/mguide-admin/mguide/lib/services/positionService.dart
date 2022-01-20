import 'dart:collection';

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mguide/models/models.dart';
import 'package:mguide/services/restService.dart';
import 'package:permission_handler/permission_handler.dart';

class PositionService extends ChangeNotifier {
  final MethodChannel platform =
      const MethodChannel('samples.flutter.dev/soundProcessor');

  Point? _position;
  bool isTrackingStarted = false;
  String lastKnownPosition = "";
  Timer? timer;

  Point? get position => (_position);

  void startTracking() async {
    if(isTrackingStarted) {
      return;
    }

    String recordingStatus = "";
    String permission = "";
    if (await Permission.microphone.request().isGranted) {
      permission = "Permission granted";
    } else {
      permission = "Unable to get permission";
    }

    try {
      final bool result = await platform.invokeMethod('startRecording');
      if (result) {
        recordingStatus = 'Recording has been started';
        isTrackingStarted = true;
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) => getLastKnownPosition());
      } else {
        recordingStatus = 'Recording cannot be started';
      }
    } on PlatformException catch (e) {
      recordingStatus = "Start failed because '${e.message}'.";
    }
    print("recordingStatus: ${recordingStatus}, permission: ${permission}");
    notifyListeners();
  }

  void getLastKnownPosition() async {
    try {
      final List result = await platform.invokeMethod('getLastKnownPosition');
      lastKnownPosition = "Last known position: (x: ${result[0].toStringAsFixed(2)}, y: ${result[1].toStringAsFixed(2)})";
      _position = Point(null, null, result[0], result[1], 0.0 );
    } on PlatformException catch (e) {
      lastKnownPosition = "Failed because '${e.message}'.";
    }
     notifyListeners();
  }

  void stopTracking() async {
    String recordingStatus;
    try {
      final bool result = await platform.invokeMethod('stopRecording');
      if (result) {
        recordingStatus = 'Recording has been stopped';
      } else {
        recordingStatus = 'Recording cannot be stopped';
      }
    } on PlatformException catch (e) {
      recordingStatus = "Stop failed because '${e.message}'.";
    }
    print("recordingStatus: ${recordingStatus}");
    isTrackingStarted = false;
    timer?.cancel();
    notifyListeners();
  }
}
