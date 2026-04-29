import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 提供 SharedPreferences 实例的 Provider
// 我们在 main.dart 中将其初始化并重写
final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class PersistenceService {
  final SharedPreferences _prefs;
  PersistenceService(this._prefs);

  // 示例：保存是否第一次运行
  Future<void> setFirstRun(bool value) async {
    await _prefs.setBool('is_first_run', value);
  }

  bool get isFirstRun => _prefs.getBool('is_first_run') ?? true;
}
