import 'package:commons/commons.dart';
import 'package:data/src/remote/api/master.dart';
import 'package:domain/domain.dart';

class MasterRepositoryImpl implements MasterRepository {
  MasterApi _api;
  MasterRepositoryImpl(this._api);

  @override
  Future<NetworkResponse<MasterData>> getMasterData() async {
    final response = await _api.fetchMasterData();
    response.data = MasterData.fromJson(response.data ?? Map());
    final networkResponse = NetworkResponse<MasterData>(response);
    return networkResponse;
  }
}
