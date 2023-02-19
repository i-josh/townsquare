import 'package:shared_preferences/shared_preferences.dart';

enum StorageType { string, int, bool }

class LocalStorage {
  Future save({
    required String key,
    dynamic value,
    required StorageType type,
  }) async {
    SharedPreferences pref = await _getPrefs();
    switch (type) {
      case StorageType.string:
        pref.setString(key, value);
        break;
      case StorageType.bool:
        pref.setBool(key, value);
        break;
      case StorageType.int:
        pref.setInt(key, value);
        break;
    }
  }

  Future<dynamic> fetch({
    required String key,
    required StorageType type,
  }) async {
    SharedPreferences pref = await _getPrefs();

    dynamic result;
    switch (type) {
      case StorageType.string:
        result = pref.getString(key);
        break;
      case StorageType.bool:
        result = pref.getBool(key);
        break;
      case StorageType.int:
        result = pref.getInt(key);
        break;
    }

    return result;
  }

  Future delete({required String key}) async {
    SharedPreferences pref = await _getPrefs();
    await pref.remove(key);
  }

  Future<SharedPreferences> _getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
