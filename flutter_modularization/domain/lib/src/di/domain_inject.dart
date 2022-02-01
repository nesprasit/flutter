import 'package:commons/commons.dart';
import 'package:domain/src/usecase/login_usecase.dart';
import 'package:domain/src/usecase/master_usecase.dart';

Future<void> init() async {
  inject.registerLazySingleton(() => LoginUseCase(inject()));
  inject.registerLazySingleton(() => MasterUseCase(inject()));
}
