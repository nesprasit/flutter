import 'package:flutter/material.dart';
import 'package:flutter_camera_and_image/src/preview_picture.dart';

void main() {
  runApp(App());
}

class App extends MaterialApp {
  @override
  bool get debugShowCheckedModeBanner => false;

  @override
  ThemeData get theme => ThemeData();

  @override
  Widget get home => PreviewPicture();
}
