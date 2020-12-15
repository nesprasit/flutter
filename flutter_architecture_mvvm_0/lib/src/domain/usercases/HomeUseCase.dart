import 'package:flutter_architecture_mvvm_0/src/data/models/home/HomeResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkResponse.dart';
import 'package:flutter_architecture_mvvm_0/src/data/repository/home/HomeRepository.dart';

class HomeUseCase {
  HomeRepository homeRepository;

  HomeUseCase(HomeRepository homeRepository) {
    this.homeRepository = homeRepository;
  }

  Future<NetworkResponse<HomeResponseModel>> getHomeList() => homeRepository.getHomeList();
}
