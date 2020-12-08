import 'package:flutter_persistent_storage/data/shared_pref/shared_pref.dart';

class SharedPrefManager extends SharedPref {
  static final SharedPrefManager _singleton = SharedPrefManager._internal();
  factory SharedPrefManager() => _singleton;
  SharedPrefManager._internal();

  final USERS_KEY = 'USERS_KEY';

  saveUsers(String value) async {
    return await putString(USERS_KEY, value);
    ;
  }

  Future<String> getUsers() async {
    return await getString(USERS_KEY);
  }
}
