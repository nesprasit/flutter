import 'package:flutter/material.dart';
import 'package:flutter_web_socket/res/colors.dart';
import 'package:flutter_web_socket/src/chat_list.dart';
import 'package:flutter_web_socket/src/chat_room.dart';

void main() {
  runApp(App());
}


class App extends MaterialApp {
  @override
  bool get debugShowCheckedModeBanner => false;
  
  @override
  ThemeData get theme => ThemeData(
      fontFamily: 'Kanit-Regular',
      primaryColor: color_primary,
      scaffoldBackgroundColor: color_white,
      backgroundColor: color_white,
      dialogBackgroundColor: color_white,
      accentColor: color_primary);

  @override
  Widget get home => ChatList();
}
