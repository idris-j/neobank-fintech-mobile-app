import 'package:shared_preferences/shared_preferences.dart';

class localStorage {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    return await _getPrefs().then((pref) {
      return pref.getString(key);
    });
  }

  Future<int?> getInt(String key) async {
    return await _getPrefs().then((pref) {
      return pref.getInt(key);
    });
  }

  Future<bool?> getBool(String key) async {
    return await _getPrefs().then((pref) {
      return pref.getBool(key);
    });
  }

  void saveString(String key, String value) async {
    await _getPrefs().then((pref) {
      pref.setString(key, value);
    });
  }

  void saveInt(String key, int value) async {
    await _getPrefs().then((pref) {
      pref.setInt(key, value);
    });
  }

  void saveBool(String key, bool value) async {
    await _getPrefs().then((pref) {
      pref.setBool(key, value);
    });
  }

  void clearStorage() async {
    await _getPrefs().then((pref) {
      pref.clear();
    });
  }
}
