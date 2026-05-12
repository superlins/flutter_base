import 'package:flutter/foundation.dart';
import 'package:envied/envied.dart';

part 'app_config.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class AppConfig {
  AppConfig._();

  @EnviedField(varName: 'SUPABASE_URL')
  static final String supabaseUrl = _AppConfig.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY')
  static final String supabaseAnonKey = _AppConfig.supabaseAnonKey;

  /// 是否开启日志（仅在调试模式下开启）
  static bool get enableLogging => kDebugMode;

  /// 是否为生产环境
  static bool get isProduction => kReleaseMode;
}
