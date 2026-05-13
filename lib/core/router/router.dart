import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/domain/models/auth_state.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/main_screen.dart';

part 'router.g.dart';

class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier(Ref ref) {
    ref.listen(authProvider, (prev, next) => notifyListeners());
  }
}

@riverpod
Listenable routerListenable(Ref ref) {
  return _RouterRefreshNotifier(ref);
}

// 🔐 白名单模式：只有在白名单中的路径，才允许匿名访问
const publicRoutes = ['/', '/login'];

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

@riverpod
GoRouter router(Ref ref) {
  final listenable = ref.watch(routerListenableProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: listenable,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final bool loggedIn = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      final isPublic = publicRoutes.contains(state.matchedLocation);

      // 1. 非公开页面且未登录 -> 强制跳登录
      if (!isPublic && !loggedIn) {
        return '/login';
      }

      final isLoggingIn = state.matchedLocation == '/login';

      // 2. 已登录且还在登录页 -> 跳回主页
      if (loggedIn && isLoggingIn) {
        return '/';
      }

      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: MainTab.values.map((tab) {
          return StatefulShellBranch(
            routes: [
              GoRoute(
                path: tab.path,
                builder: (context, state) {
                  switch (tab) {
                    case MainTab.home:
                      return const HomeScreen();
                    case MainTab.profile:
                      // 基础脚手架采用通用的内联占位符展示，保持代码库极致纯净
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Profile'),
                          centerTitle: true,
                        ),
                        body: const Center(
                          child: Text('Profile Tab (Placeholder)'),
                        ),
                      );
                  }
                },
              ),
            ],
          );
        }).toList(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
