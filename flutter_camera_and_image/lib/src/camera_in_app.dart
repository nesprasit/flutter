import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_and_image/utils/camera_manager.dart';
import 'package:path_provider/path_provider.dart';

class CameraInApp extends StatefulWidget {
  @override
  _CameraInAppState createState() => _CameraInAppState();
}

class _CameraInAppState extends State<CameraInApp> {
  CameraManager _cameraManager;

  // List<CameraDescription> _cameras;
  // CameraController _controllerCamera;

  @override
  void initState() {
    super.initState();
    _cameraManager = CameraManager(
      changed: () {
        setState(() {});
      },
      error: (err) {
        print(err);
      },
    );

    _cameraManager.initAvailableCameras();
  }

  // _initAvailableCameras() async {
  //   _cameras = await availableCameras().catchError((err) {
  //     print('Available Cameras $err');
  //   });

  //   if (_cameras != null) {
  //     if (_cameras.length > 0) {
  //       await _initCamera(_cameras[0]);
  //     } else {
  //       print('No camera available');
  //     }
  //   }
  // }

  // _initCamera(CameraDescription description) async {
  //   if (_controllerCamera != null) {
  //     await _controllerCamera.dispose();
  //   }

  //   _controllerCamera = CameraController(
  //     description,
  //     ResolutionPreset.veryHigh,
  //     enableAudio: false,
  //   );

  //   _controllerCamera.addListener(() {
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   });

  //   if (_controllerCamera.value.hasError) {
  //     print('Camera error ${_controllerCamera.value.errorDescription}');
  //   }

  //   try {
  //     await _controllerCamera.initialize();
  //   } catch (e) {
  //     print('Camera Exception error $e');
  //   }

  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  void dispose() {
    _cameraManager?.getControllerCamera()?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _cameraManager?.getControllerCamera()?.value?.isInitialized == true
          ? Stack(
              children: [
                _cameraManager?.cameraPreview(),
                buidTakePicture(),
              ],
            )
          : Container(color: Colors.white),
    );
  }

  Widget buidTakePicture() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 110,
          color: Colors.black.withOpacity(0.3),
          child: Align(
            child: FlatButton(
              onPressed: () {
                _takePicture();
              },
              height: 70,
              shape: CircleBorder(),
              child: Icon(Icons.camera, color: Colors.white, size: 35),
              color: Colors.blue,
            ),
          ),
        ),
      );

  _takePicture() async {
    try {
      Directory temp = await getTemporaryDirectory();
      DateTime name = DateTime.now();
      String path = "${temp.path}/${name}_picture.png";

      await _cameraManager?.getControllerCamera()?.takePicture(path);
      Navigator.pop(context, path);
    } catch (err) {
      print('Take picture $err');
    }
  }
}
