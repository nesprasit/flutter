import 'package:commons/commons.dart';
import 'package:home/src/home/home_viewmodel.dart';

Future<void> init() async {

  // ViewModel
  inject.registerFactory(() => HomeViewModel());
}
