import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations_example/home.dart';
import 'package:flutter_localizations_example/res/lang/generated/l10n.dart';

void main() {
  runApp(App());
}

class App extends MaterialApp {
  @override
  bool get debugShowCheckedModeBanner => false;
  
  @override
  Iterable<LocalizationsDelegate> get localizationsDelegates => [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @override
  Iterable<Locale> get supportedLocales => [
        const Locale('en', ''),
        const Locale('th', ''),
      ];

  @override
  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      );

  @override
  Widget get home => Home();
}
