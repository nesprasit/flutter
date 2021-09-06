import 'dart:io';
import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkHttpOverride.dart';
import 'package:flutter_architecture_mvvm_0/src/servicelocator/ServiceLocator.dart';
import 'package:flutter_architecture_mvvm_0/src/views/presentation/home/HomeScreen.dart';
void main() {
  _setup();
  runApp(App());
}

void _setup() {
  setupLocator();
  HttpOverrides.global = NetworkHttpOverride();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppMaterial();
}

class AppMaterial extends MaterialApp {
  @override
  ThemeData get theme => ThemeData();

  @override
  Widget get home => HomeScreen();

  @override
  GlobalKey<NavigatorState> get navigatorKey => serviceLocator<Alice>().getNavigatorKey();
}
