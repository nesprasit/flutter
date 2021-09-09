import 'package:data/src/remote/api/characters_api.dart';
import 'package:domain/domain.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharactersApi _api;
  CharacterRepositoryImpl(this._api);

  @override
  Future<NetworkResponse<CharacterList>> getCharacterList() async {
    final response = await _api.fetchCharacterList(Map());
    response.data = CharacterList.fromJson(response.data ?? Map());
    final networkResponse =  NetworkResponse<CharacterList>(response);
    return networkResponse;
  }
}
