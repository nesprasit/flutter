import 'package:flutter_persistent_storage/ui/sharedpref/shared_pref_manager.dart';

class SharedPrefManagerImlp extends SharedPrefManager {
  static final SharedPrefManagerImlp _singleton =
      SharedPrefManagerImlp._internal();

  factory SharedPrefManagerImlp() {
    return _singleton;
  }

  SharedPrefManagerImlp._internal();

  final USERS_KEY = 'USERS_KEY';

  saveUsers(String value) async {
    return await putString(USERS_KEY, value);
  }

  Future<String> getUsers() async {
    return await getString(USERS_KEY);
  }
}
