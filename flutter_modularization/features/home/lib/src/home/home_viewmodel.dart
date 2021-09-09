import 'package:commons/commons.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  CharacterUseCase _characterUseCase = inject();
  List<CharacterData> _characterData = [];

  _setCharacterData(List<CharacterData> list) {
    _characterData = [];
    _characterData = list;
    notifyListeners();
  }

  getCharacterData() => _characterData;

  Future getCharacterList() async {
    final response = await _characterUseCase.getCharacterList();
    print('response HomeViewModel ${response.data?.data}');
  }
}
