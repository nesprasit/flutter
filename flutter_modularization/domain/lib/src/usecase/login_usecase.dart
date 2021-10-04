import 'package:domain/domain.dart';

class LoginUseCase{
  LoginRepository _repo;
  LoginUseCase(this._repo);

  Future<NetworkResponse<Login>> login(String username,String password) => _repo.login(username, password);
}