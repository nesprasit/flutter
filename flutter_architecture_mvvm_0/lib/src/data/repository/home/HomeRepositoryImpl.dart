import 'package:flutter_architecture_mvvm_0/src/data/models/home/HomeResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/api/home/HomeApi.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkResponse.dart';
import 'package:flutter_architecture_mvvm_0/src/data/repository/home/HomeRepository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeApi homeApi;

  HomeRepositoryImpl(HomeApi homeApi) {
    this.homeApi = homeApi;
  }

  @override
  Future<NetworkResponse<HomeResponseModel>> getHomeList() => homeApi.getHomeList();
}
