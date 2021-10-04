import 'package:data/src/remote/api/login_api.dart';
import 'package:domain/domain.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginApi _api;
  LoginRepositoryImpl(this._api);

  @override
  Future<NetworkResponse<Login>> login(String username,String password) async {
    final body = Map<String,String>();
    body['email'] = username;
    body['password'] = password;

    final response = await _api.fetchLogin(body);
    response.data = Login.fromJson(response.data ?? Map());
    final networkResponse =  NetworkResponse<Login>(response);
    return networkResponse;
  }
}
