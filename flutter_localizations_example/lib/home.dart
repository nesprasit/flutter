import 'package:flutter/material.dart';
import 'package:flutter_localizations_example/res/lang/generated/l10n.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 10, top: 20),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      AppLocalizations.load(Locale('th'));
                    });
                  },
                  color: Colors.blue,
                  child: Text('Thai',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      AppLocalizations.load(Localizations.localeOf(context));
                    });
                  },
                  color: Colors.blue,
                  child: Text('Default',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(right: 10, top: 20),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      AppLocalizations.load(Locale('en'));
                    });
                  },
                  color: Colors.blue,
                  child: Text('Eng',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Align(
              child: Text(
                AppLocalizations.of(context).home,
                style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
