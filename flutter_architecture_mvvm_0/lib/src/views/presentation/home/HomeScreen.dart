import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buidBody(),
    );
  }

  Widget _buidBody() => SafeArea(
        child: RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _HomeListItem();
              },
            ),
            onRefresh: _refresh),
      );

  Future _refresh() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});
  }
}

class _HomeListItem extends Align {
  @override
  Widget get child => Container(
        color: Colors.amber,
        child: Column(
          children: [
            Row(
              children: [
                Text('HI'),
              ],
            ),
            Divider()
          ],
        ),
      );
}
