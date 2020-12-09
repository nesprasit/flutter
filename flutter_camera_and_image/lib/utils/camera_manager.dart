import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraManager {
  Function _changed;
  Function(String) _error;

  List<CameraDescription> _cameras;
  CameraController _controllerCamera;

  CameraManager({Function changed, Function(String) error}) {
    this._changed = changed;
    this._error = error;
  }

  initAvailableCameras() async {
    _cameras = await availableCameras().catchError((err) {
      _error?.call('Error available cameras $err');
    });

    if (_cameras != null) {
      if (_cameras.length > 0) {
        await initCamera(_cameras[0]);
      } else {
        _error?.call('No camera available');
      }
    }
  }

  initCamera(CameraDescription description) async {
    if (_controllerCamera != null) {
      await _controllerCamera.dispose();
    }

    _controllerCamera = CameraController(
      description,
      ResolutionPreset.veryHigh,
      enableAudio: false,
    );

    _controllerCamera.addListener(() {
      _changed?.call();
    });

    if (_controllerCamera.value.hasError) {
      _error?.call('Error camera ${_controllerCamera.value.errorDescription}');
    }

    try {
      await _controllerCamera.initialize();
    } catch (e) {
      _error?.call('Error camera exception $e');
    }

    _changed?.call();
  }

  getControllerCamera() => _controllerCamera;
  getCameras() => _cameras;

  Widget cameraPreview() => CameraPreview(getControllerCamera());

  dispose() {
    _controllerCamera?.dispose();
  }
}
