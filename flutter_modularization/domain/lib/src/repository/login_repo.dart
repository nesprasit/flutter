import 'package:domain/domain.dart';
import 'package:domain/src/models/login/login.dart';

abstract class LoginRepository{
   Future<NetworkResponse<Login>> login(String username,String password);
}