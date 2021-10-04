import 'package:domain/domain.dart';

abstract class MasterRepository{
   Future<NetworkResponse<MasterData>> getMasterData();
}