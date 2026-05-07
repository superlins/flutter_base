import 'package:envied/envied.dart';

part 'app_config.g.dart';

enum AppEnvironment {
  dev,
  prod,
}

@Envied(path: '.env', obfuscate: true)
abstract class AppConfig {
  AppConfig._();

  @EnviedField(varName: 'ENV')
  static final String _env = _AppConfig._env;

  @EnviedField(varName: 'BASE_URL_DEV')
  static final String _baseUrlDev = _AppConfig._baseUrlDev;

  @EnviedField(varName: 'BASE_URL_PROD')
  static final String _baseUrlProd = _AppConfig._baseUrlProd;

  @EnviedField(varName: 'APP_NAME')
  static final String appName = _AppConfig.appName;

  /// 获取当前环境类型
  static AppEnvironment get environment => _env == 'prod'
      ? AppEnvironment.prod
      : AppEnvironment.dev;

  /// 各环境 API 域名配置（自动匹配对应安全变量）
  static String get baseUrl {
    switch (environment) {
      case AppEnvironment.prod:
        return _baseUrlProd;
      case AppEnvironment.dev:
        return _baseUrlDev;
    }
  }

  static bool get enableLogging => environment == AppEnvironment.dev;
}
