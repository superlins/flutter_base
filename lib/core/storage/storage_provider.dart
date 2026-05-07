import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_provider.g.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
  
  // For drama history (client-side only)
  List<String> getDramaHistory() {
    return _prefs.getStringList('drama_history') ?? [];
  }

  Future<void> addDramaToHistory(String dramaId) async {
    final history = getDramaHistory();
    if (!history.contains(dramaId)) {
      history.insert(0, dramaId);
      await _prefs.setStringList('drama_history', history);
    }
  }
}

@riverpod
StorageService storage(Ref ref) {
  throw UnimplementedError('StorageService must be overridden in ProviderScope');
}
