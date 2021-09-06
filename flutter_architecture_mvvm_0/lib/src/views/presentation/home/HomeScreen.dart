import 'package:flutter/material.dart';
import 'package:flutter_architecture_mvvm_0/res/sizes.dart';
import 'package:flutter_architecture_mvvm_0/src/data/models/home/HomeResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/servicelocator/ServiceLocator.dart';
import 'package:flutter_architecture_mvvm_0/src/views/presentation/home/HomeViewModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => serviceLocator<HomeViewModel>(),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  void initState() {
    super.initState();
    callHomeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return _buidBody(viewModel);
        },
      ),
    );
  }

  Widget _buidBody(HomeViewModel viewModel) => SafeArea(
        child: RefreshIndicator(
            child: ListView.builder(
              itemCount: viewModel.getHomeList().length,
              itemBuilder: (context, index) {
                return _HomeListItem(data: viewModel.getHomeList()[index]);
              },
            ),
            onRefresh: callHomeList),
      );

  Future callHomeList() async {
    await context.read<HomeViewModel>().callHomeList();
    // await Future.delayed(Duration(milliseconds: 2000), () async {
      
    // });
  }
}

// ignore: must_be_immutable
class _HomeListItem extends Align {
  HomeResponseData data;
  _HomeListItem({this.data});

  @override
  Widget get child => Container(
        child: Column(
          children: [
            Row(
              children: [
                _buildPicture(),
                _buildDetail(),
              ],
            ),
            Divider()
          ],
        ),
      );

  Widget _buildPicture() => Container(
        margin: const EdgeInsets.all(px7),
        child: Image.network(
          data.characterPicture,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildDetail() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Name : ${data.characterName}'),
            Text('Gender : ${data.characterGender}'),
            Text('Age : ${data.characterAge}')
          ],
        ),
      );
}
