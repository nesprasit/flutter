import 'package:domain/domain.dart';

class MasterUseCase {
  MasterRepository _repo;
  MasterUseCase(this._repo);

  Future<NetworkResponse<MasterData>> getMasterData() => _repo.getMasterData();
}
