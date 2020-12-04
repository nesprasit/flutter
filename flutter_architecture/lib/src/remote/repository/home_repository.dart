import 'package:flutter_provider/src/di/service_locator.dart';
import 'package:flutter_provider/src/remote/network/network_response.dart';
import 'package:flutter_provider/src/remote/network/network_result.dart';

class HomeRepository {
  final network = serviceLocator<NetworkResponse>();
 
  Future<NetworkResult> getTodoList() {
    return network.get(endpoint: 'todo/list');
  }
}
