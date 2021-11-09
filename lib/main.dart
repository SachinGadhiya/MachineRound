// @dart=2.9

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:camera_deep_ar/camera_deep_ar.dart';

const apikey =
    "e66c9c0b45d2a9d1a1184dde5f66a96136bc5d5b6cc30d6edf78ab3e27a9388668c19987db1bcb02";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int effectCount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
            child: Stack(
              children: [
                CameraDeepAr(
                    onCameraReady: (isReady) {
                      setState(() {});
                    },
                    onImageCaptured: (path) {
                      setState(() {});
                    },
                    onVideoRecorded: (path) {
                      setState(() {});
                    },
                    androidLicenceKey: apikey,
                    iosLicenceKey: apikey,
                    cameraDeepArCallback: (c) async {
                      cameraDeepArController = c;
                      setState(() {});
                    }),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: FloatingActionButton(
                            backgroundColor: Colors.amber,
                            child: Icon(Icons.navigate_next),
                            onPressed: () => {
                                  cameraDeepArController
                                      .changeMask(effectCount),
                                  if (effectCount == 7) {effectCount = 0},
                                  effectCount++
                                }))),
              ],
            ),
          )),
    );
  }
}
