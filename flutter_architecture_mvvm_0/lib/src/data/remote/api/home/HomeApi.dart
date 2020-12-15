import 'package:flutter_architecture_mvvm_0/src/data/models/home/HomeResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkResponse.dart';

abstract class HomeApi {
  Future<NetworkResponse<HomeResponseModel>> getHomeList();
}
