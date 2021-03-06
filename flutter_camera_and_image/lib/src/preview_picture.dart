import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera_and_image/src/camera_in_app.dart';
import 'package:flutter_camera_and_image/utils/pick_image.dart';

class PreviewPicture extends StatefulWidget {
  @override
  _PreviewPictureState createState() => _PreviewPictureState();
}

class _PreviewPictureState extends State<PreviewPicture> {
  File _image;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Picture'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 14, top: 14),
                  child: Text('Select Picture'),
                ),
                buildButtonSelectImage(),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: _image != null ? Image.file(_image) : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonSelectImage() => Container(
        margin: const EdgeInsets.only(left: 14, top: 14, right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    minWidth: 130,
                    onPressed: () {
                      _pickImage();
                    },
                    child: Text(
                      'Gallery',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                  FlatButton(
                    minWidth: 130,
                    onPressed: () {
                      _takeCamera();
                    },
                    child: Text(
                      'Take a picture',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  ),
                  FlatButton(
                    minWidth: 130,
                    onPressed: () {
                      _openCameraInApp();
                    },
                    child: Text(
                      'Take a picture in app',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                  )
                ],
              ),
            )
          ],
        ),
      );

  _takeCamera() async {
    final picked = await PickerImage.takeCamera();

    setState(() {
      if (picked != null) {
        _image = File(picked.path);
      } else {
        print('path file err $picked');
      }
    });
  }

  _pickImage() async {
    final picked = await PickerImage.pickerGallery();

    setState(() {
      if (picked != null) {
        _image = File(picked.path);
      } else {
        print('path file err $picked');
      }
    });
  }

  _openCameraInApp() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraInApp(),
      ),
    );

    if (result != null) {
      setState(() {
        _image = File(result);
      });
    }
  }
}
