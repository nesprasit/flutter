import 'package:domain/src/model/character_list/character_list.dart';
import 'package:domain/src/repository/character_repo.dart';
import 'package:domain/src/utils/network_response.dart';

class CharacterUseCase{
  CharacterRepository _repo;
  CharacterUseCase(this._repo);

  Future<NetworkResponse<CharacterList>> getCharacterList() => _repo.getCharacterList();
}
