import 'package:data/src/remote/http_client.dart';
import 'package:domain/domain.dart';

class MasterApi extends HttpClient {
  Future<NetworkResponse> fetchMasterData() async {
    return get(endpoint: 'v2/masterData/contact');
  }
}
