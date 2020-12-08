import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_persistent_storage/ui/home.dart';

void main() {
  runApp(AppAndroid());
}

class AppAndroid extends MaterialApp {
  @override
  bool get debugShowCheckedModeBanner => false;

  @override
  ThemeData get theme => ThemeData();

  @override
  Widget get home => Home();
}

class AppIOS extends CupertinoApp {
  @override
  bool get debugShowCheckedModeBanner => false;

  @override
  CupertinoThemeData get theme => CupertinoThemeData();

  @override
  Widget get home => Home();
}
