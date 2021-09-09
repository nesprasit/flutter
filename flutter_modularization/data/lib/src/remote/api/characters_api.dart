 
import 'package:data/src/remote/http_client.dart';
import 'package:domain/domain.dart';

class CharactersApi extends HttpClient{
   Future<NetworkResponse> fetchCharacterList(Map<String, String> params) async{
    return get(endpoint: 'kimetsu_no_yaiba/list',param: params);
  }
 }