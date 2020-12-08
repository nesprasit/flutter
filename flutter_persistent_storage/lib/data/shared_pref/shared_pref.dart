import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<SharedPreferences> _instance() async =>
      await SharedPreferences.getInstance();

  putString(String key, String value) async {
    SharedPreferences pref = await _instance();
    return await pref.setString(key, value);
  }

  putInt(String key, int value) async {
    SharedPreferences pref = await _instance();
    return await pref.setInt(key, value);
  }

  putBoolean(String key, bool value) async {
    SharedPreferences pref = await _instance();
    return await pref.setBool(key, value);
  }

  putDouble(String key, double value) async {
    SharedPreferences pref = await _instance();
    return await pref.setDouble(key, value);
  }

  putStringList(String key, List<String> value) async {
    SharedPreferences pref = await _instance();
    return await pref.setStringList(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences pref = await _instance();
    return pref.getString(key);
  }

  getInt(String key) async {
    SharedPreferences pref = await _instance();
    return pref.getInt(key);
  }

  getBoolean(String key) async {
    SharedPreferences pref = await _instance();
    return pref.getBool(key);
  }

  getDouble(String key) async {
    SharedPreferences pref = await _instance();
    return pref.getDouble(key);
  }

  getStringList(String key) async {
    SharedPreferences pref = await _instance();
    return pref.getStringList(key);
  }

  remove(String key) async {
    SharedPreferences pref = await _instance();
    return await pref.remove(key);
  }

  reload() async {
    SharedPreferences pref = await _instance();
    await pref.reload();
  }

  clear() async {
    SharedPreferences pref = await _instance();
    return pref.clear();
  }
}
