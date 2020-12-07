import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_persistent_storage/ui/sharedpref/screen_shared_pref.dart';
import 'package:flutter_persistent_storage/ui/sql/screen_sql.dart';

class Home extends StatefulWidget {
  final _platformChanel = MethodChannel("flutter.native/utils");

  Home() {
    getTextNavtiveApp();
  }

  Future getTextNavtiveApp() async {
    final text = await _platformChanel.invokeMethod<String>("getText");
    print('Native $text');
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> names = ['Shared Preferences', 'SQLite'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(names[index]),
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenSharedPref(),
                        ));
                    break;
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenSql(),
                        ));
                    break;
                  default:
                }
              },
            );
          },
        ),
      ),
    );
  }
}
