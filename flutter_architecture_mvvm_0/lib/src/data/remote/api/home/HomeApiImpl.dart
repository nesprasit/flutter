import 'package:flutter_architecture_mvvm_0/src/data/models/home/HomeResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/api/home/HomeApi.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/Network.dart'
    as service;
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkResponse.dart';

class HomeApiImpl implements HomeApi {
  
  @override
  Future<NetworkResponse<HomeResponseModel>> getHomeList() async {
    final response = await service.get(endpoint: 'kimetsu_no_yaiba/list');
    response.data = HomeResponseModel.fromJson(response.data ?? Map());
    return NetworkResponse<HomeResponseModel>(response);
  }
}
