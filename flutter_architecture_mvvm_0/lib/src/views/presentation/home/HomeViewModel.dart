import 'package:flutter/material.dart';
import 'package:flutter_architecture_mvvm_0/src/data/models/home/HomeResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkResponse.dart';
import 'package:flutter_architecture_mvvm_0/src/domain/usercases/HomeUseCase.dart';
import 'package:flutter_architecture_mvvm_0/src/servicelocator/ServiceLocator.dart';

class HomeViewModel extends ChangeNotifier {
  List<HomeResponseData> _homeList = [];
  HomeUseCase _homeUseCase = serviceLocator<HomeUseCase>();

  _setHoneList(List<HomeResponseData> data) {
    this._homeList = data;
    notifyListeners();
  }

  List<HomeResponseData> getHomeList() => _homeList;

  Future callHomeList() async {
    final result = await _homeUseCase.getHomeList();
    switch (result.state) {
      case NetworkResponseState.SUCCESS:
        _setHoneList(result.data.data);
        break;
      case NetworkResponseState.ERROR:
        print(result.state);
        break;
      case NetworkResponseState.LOGOUT:
        print(result.state);
        break;
      case NetworkResponseState.UNKNOWN_ERROR:
        print(result.state);
        break;
      case NetworkResponseState.API_ERROR:
        print(result.state);
        break;
      case NetworkResponseState.TIMEOUT:
        print(result.state);
        break;
      case NetworkResponseState.DISCOUNTED:
        print(result.state);
        break;
      default:
        print(result.state);
        break;
    }
  }
}
