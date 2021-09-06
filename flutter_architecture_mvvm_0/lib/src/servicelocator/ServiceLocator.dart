import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/api/home/HomeApiImpl.dart';
import 'package:flutter_architecture_mvvm_0/src/data/repository/home/HomeRepositoryImpl.dart';
import 'package:flutter_architecture_mvvm_0/src/domain/usercases/HomeUseCase.dart';
import 'package:flutter_architecture_mvvm_0/src/views/presentation/home/HomeViewModel.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.I;

void setupLocator() {
  _setup();
  _registerApi();
  _registerRepository();
  _registerUseCase();
  _registerViewModel();
}

void _setup() {
  GetIt.I.registerLazySingleton(() => Dio());
  GetIt.I.registerLazySingleton(() => Alice(
        showNotification: true,
        showInspectorOnShake: true,
        maxCallsCount: 1000,
      ));
}

void _registerApi() {
  // Home
  GetIt.I.registerLazySingleton(() => HomeApiImpl());
}

void _registerRepository() {
  // Home
  GetIt.I.registerLazySingleton(
    () => HomeRepositoryImpl(
      serviceLocator<HomeApiImpl>(),
    ),
  );
}

void _registerUseCase() {
  // Home
  GetIt.I.registerFactory(
    () => HomeUseCase(
      serviceLocator<HomeRepositoryImpl>(),
    ),
  );
}

void _registerViewModel() {
  // Home
  GetIt.I.registerFactory(() => HomeViewModel());
}
