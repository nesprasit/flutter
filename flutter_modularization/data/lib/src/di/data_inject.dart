import 'package:alice/alice.dart';
import 'package:commons/commons.dart';
import 'package:data/src/remote/api/characters_api.dart';
import 'package:data/src/repository/character_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

Future<void> init() async {
  inject.registerLazySingleton(() => Dio());
  inject.registerLazySingleton(() => Alice(
        showNotification: true,
        showInspectorOnShake: true,
        maxCallsCount: 1000,
      ));
  await _api();
  await _repo();
}

Future<void> _api() async {
  inject.registerLazySingleton(() => CharactersApi());
}

Future<void> _repo() async {
  inject.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(inject()));
}
