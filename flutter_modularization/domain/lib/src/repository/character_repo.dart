
import 'package:domain/domain.dart';
import 'package:domain/src/utils/network_response.dart';

abstract class CharacterRepository{
   Future<NetworkResponse<CharacterList>> getCharacterList();
}