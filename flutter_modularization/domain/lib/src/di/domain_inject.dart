import 'package:commons/commons.dart';
import 'package:domain/src/usecase/character_usecase.dart';

Future<void> init() async {
  inject.registerLazySingleton(() => CharacterUseCase(inject()));
}
