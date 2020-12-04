import 'package:flutter_provider/src/remote/network/network_response.dart';
import 'package:flutter_provider/src/remote/repository/home_repository.dart';
import 'package:flutter_provider/src/ui/home/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.I;

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NetworkResponse());
  _setupRepositories();
  _setupViewModels();
}

void _setupRepositories() {
  GetIt.I.registerLazySingleton(() => HomeRepository());
}

void _setupViewModels() {
  GetIt.I.registerLazySingleton(() => HomeViewModel());
}
