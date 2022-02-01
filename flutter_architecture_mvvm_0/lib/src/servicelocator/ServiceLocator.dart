import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/api/home/HomeApiImpl.dart';
import 'package:flutter_architecture_mvvm_0/src/data/repository/home/HomeRepositoryImpl.dart';
import 'package:flutter_architecture_mvvm_0/src/domain/usercases/HomeUseCase.dart';
import 'package:flutter_architecture_mvvm_0/src/views/presentation/home/HomeViewModel.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await _setup();
  await _registerApi();
  await _registerRepository();
  await _registerUseCase();
  await _registerViewModel();
}

Future<void> _setup() async {
  GetIt.I.registerLazySingleton(() => Dio());
  GetIt.I.registerLazySingleton(() => Alice(
        showNotification: true,
        showInspectorOnShake: true,
        maxCallsCount: 1000,
      ));

  serviceLocator<Dio>().options = BaseOptions(
    baseUrl: 'https://us-central1-playground-24194.cloudfunctions.net/api/',
  );
}

Future<void> _registerApi() async {
  // Home
  GetIt.I.registerLazySingleton(() => HomeApiImpl());
}

Future<void> _registerRepository() async {
  // Home
  GetIt.I.registerLazySingleton(
    () => HomeRepositoryImpl(
      serviceLocator<HomeApiImpl>(),
    ),
  );
}

Future<void> _registerUseCase() async {
  // Home
  GetIt.I.registerFactory(
    () => HomeUseCase(
      serviceLocator<HomeRepositoryImpl>(),
    ),
  );
}

Future<void> _registerViewModel() async {
  // Home
  GetIt.I.registerFactory(() => HomeViewModel());
}
