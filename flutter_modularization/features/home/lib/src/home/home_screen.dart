import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:home/src/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => inject(),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  @override
  __HomeScreenState createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen> {

  @override
  void initState() {
    super.initState();
    _getCharacterList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DEV')),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return _buildBody(context);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Text('Hello World'),
        ),
      ),
    );
  }

  /*
   * Call Sevice
   */
  Future _getCharacterList() async {
    await Provider.of<HomeViewModel>(context).getCharacterList();
  }
}
