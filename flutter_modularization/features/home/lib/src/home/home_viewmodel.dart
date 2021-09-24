import 'package:commons/commons.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  CharacterUseCase _characterUseCase = inject();
  List<CharacterData> _characterData = [];

  set characterData(List<CharacterData> list) {
    _characterData = [];
    _characterData = list;
    notifyListeners();
  }

  List<CharacterData> get characterData => _characterData;

  Future getCharacterList() async {
    final response = await _characterUseCase.getCharacterList();
    print('response data ${response.data?.data}');
  }
}
