import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';
import 'core/storage/storage_provider.dart';
import 'core/system/theme/app_theme.dart';
import 'core/system/theme/theme_provider.dart';
import 'core/router/router.dart';

import 'package:flutter/foundation.dart';
import 'core/system/logging/app_logger.dart';

void main() async {
  // 确保 Flutter 绑定初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 1. 捕获 Flutter 渲染树中的未处理异常
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    AppLogger.error('Flutter Frame Error Catch', details.exception, details.stack);
  };

  // 2. 捕获 Dart 异步并发/主线程中的未处理底层异常
  PlatformDispatcher.instance.onError = (error, stack) {
    AppLogger.error('Platform Uncaught Error Catch', error, stack);
    return true;
  };
  
  // 初始化持久化存储
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    ProviderScope(
      overrides: [
        storageProvider.overrideWithValue(StorageService(prefs)),
      ],
      child: const MyApp(),
    ),
  );
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', ''), // 中文
        Locale('en', ''), // 英文
      ],
      
      // 主题配置
      theme: GFAppTheme.lightTheme,
      darkTheme: GFAppTheme.darkTheme,
      themeMode: themeMode,
      
      // 路由配置
      routerConfig: router,
    );
  }
}

