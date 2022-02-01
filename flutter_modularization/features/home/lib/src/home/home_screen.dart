import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:home/src/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => inject<HomeViewModel>(),
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
    // _login();
    _getMasterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DEV')),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          print('viewModel ${viewModel.masterData}');
          if (viewModel.masterData.isNotEmpty) {
            return _buildBody(context, viewModel);
          } else {
            return Container(color: Colors.amber);
          }
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeViewModel viewModel) {
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
  void _login() {
    Provider.of<HomeViewModel>(context, listen: false).login();
  }

  void _getMasterData() {
    Provider.of<HomeViewModel>(context, listen: false).getMasterData();
  }
}
