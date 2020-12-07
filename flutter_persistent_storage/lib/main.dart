import 'package:flutter/material.dart';
import 'package:flutter_persistent_storage/ui/home.dart';

void main() {
  runApp(App());
}

class App extends MaterialApp {

  @override
  bool get debugShowCheckedModeBanner => false;
  
  @override
  ThemeData get theme => ThemeData();

  @override
  Widget get home => Home();
}
