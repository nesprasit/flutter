import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_provider/res/colors.dart';
import 'package:flutter_provider/src/di/service_locator.dart';
import 'package:flutter_provider/src/ui/home/home.dart';
import 'package:flutter_provider/src/ui/room/chat.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends MaterialApp {
  @override
  Iterable<LocalizationsDelegate> get localizationsDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  @override
  Iterable<Locale> get supportedLocales => [
        const Locale('en', ''),
        const Locale('th', ''),
      ];

  @override
  ThemeData get theme => ThemeData(
      fontFamily: 'Kanit-Regular',
      primaryColor: color_primary,
      scaffoldBackgroundColor: color_white,
      backgroundColor: color_white,
      dialogBackgroundColor: color_white,
      accentColor: color_primary);

  @override
  Widget get home => Chat();
}
