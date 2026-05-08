import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:base/l10n/app_localizations.dart';
import 'core/storage/storage_provider.dart';
import 'core/system/theme/app_theme.dart';
import 'core/system/theme/theme_provider.dart';
import 'core/router/router.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/config/app_config.dart';

void main() async {
  // 确保 Flutter 绑定初始化
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 保持启动图显示
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 锁定竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 1. 捕获 Flutter 渲染树中的未处理异常
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('🚨 [Flutter Frame Error] ${details.exception}\n${details.stack}');
  };

  // 2. 捕获 Dart 异步并发/主线程中的未处理底层异常
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('🚨 [Platform Uncaught Error] $error\n$stack');
    return true;
  };

  // 3. 并行执行持久化存储与 Supabase 初始化，最大化缩减开屏耗时（Fail-Fast：任何一个失败则直接报错闪退）
  final results = await Future.wait([
    SharedPreferences.getInstance(),
    Supabase.initialize(
      url: AppConfig.supabaseUrl,
      anonKey: AppConfig.supabaseAnonKey,
    ),
  ]);
  final prefs = results[0] as SharedPreferences;

  runApp(
    ProviderScope(
      overrides: [storageProvider.overrideWithValue(StorageService(prefs))],
      child: const MyApp(),
    ),
  );

  // 首帧渲染结束后，平滑移除开屏闪屏，无缝过渡至核心业务
  FlutterNativeSplash.remove();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听路由提供者
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,

      // 多语言配置
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // 主题配置
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // 路由配置
      routerConfig: router,
    );
  }
}
