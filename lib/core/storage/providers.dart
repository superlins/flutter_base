import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SharedPreferences 实例的 Provider
/// 在 main.dart 中初始化并 override
final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'sharedPrefsProvider must be overridden in main.dart with a real SharedPreferences instance',
  );
});
