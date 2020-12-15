import 'package:flutter/material.dart';
import 'package:flutter_architecture_mvvm_0/src/views/presentation/home/HomeScreen.dart';

void main() {
  runApp(App());
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
}
