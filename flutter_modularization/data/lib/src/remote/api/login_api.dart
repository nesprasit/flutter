import 'package:data/src/remote/http_client.dart';
import 'package:domain/domain.dart';

class LoginApi extends HttpClient {
  Future<NetworkResponse> fetchLogin(Map<String, String> body) async {
    return post(endpoint: 'user/login', body: body);
  }
}
