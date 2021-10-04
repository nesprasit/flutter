import 'package:commons/commons.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

final _loginUseCase = inject<LoginUseCase>();
final _masterUseCase = inject<MasterUseCase>();

class HomeViewModel extends ChangeNotifier {
  List<MasterDataResult> _masterData = [];

  _setMasterData(List<MasterDataResult> list) {
    _masterData = [];
    _masterData = list;
    notifyListeners();
  }

  List<MasterDataResult> get masterData => _masterData;

  Future login() async {
    final email = '';
    final password = '';

    final response = await _loginUseCase.login(email, password);
    print('response token ${response.data?.result?.token}');
  }

  Future getMasterData() async {
    final response = await _masterUseCase.getMasterData();
    _setMasterData(response.data?.result ?? []);
  }
}
