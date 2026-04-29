import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/home/presentation/screens/home_screen.dart';

// 使用 Riverpod 管理路由实例
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // 首页路由
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

      // 你可以在这里继续添加其他路由，例如：
      // GoRoute(
      //   path: '/details',
      //   builder: (context, state) => const DetailsScreen(),
      // ),
    ],
    // 错误处理（可选）
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('页面未找到: ${state.error}'))),
  );
});
