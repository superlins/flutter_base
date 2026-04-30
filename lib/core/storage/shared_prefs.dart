import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _prefs;
  StorageService(this._prefs);

  static const _keyFirstRun = 'is_first_run';
  static const _keyToken = 'auth_token';

  Future<void> setFirstRun(bool value) async {
    await _prefs.setBool(_keyFirstRun, value);
  }

  bool get isFirstRun => _prefs.getBool(_keyFirstRun) ?? true;

  Future<void> setToken(String token) async {
    await _prefs.setString(_keyToken, token);
  }

  String? get token => _prefs.getString(_keyToken);

  Future<void> clear() async {
    await _prefs.clear();
  }
}
