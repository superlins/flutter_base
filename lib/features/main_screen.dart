import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/router/router.dart';
import '../core/system/theme/design_tokens.dart';
import 'auth/domain/models/auth_state.dart';
import 'auth/presentation/providers/auth_provider.dart';

// 👑 统一大政：全 App 核心 Tab 事实数据源（基础脚手架采用通用图标及路径）
enum MainTab {
  home(
    path: '/',
    label: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),
  profile(
    path: '/profile',
    label: 'Profile',
    icon: Icons.person_outline,
    selectedIcon: Icons.person,
  );

  final String path;
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const MainTab({
    required this.path,
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });
}

class MainScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  void _onTap(BuildContext context, WidgetRef ref, int index) {
    final authState = ref.read(authProvider);
    final bool isLoggedIn = authState.maybeWhen(
      authenticated: (_) => true,
      orElse: () => false,
    );

    // 🎯 动态提取：直接从中心枚举源获取目标路径，完美杜绝人工对位失误
    final targetTab = MainTab.values[index];
    final bool isPublic = publicRoutes.contains(targetTab.path);

    // 动态阻断核心：凡非白名单且未登录者，强制拦截并唤起登录！
    if (!isPublic && !isLoggedIn) {
      context.push('/login');
      return;
    }

    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: MainTab.values.map((tab) {
                return _buildNavItem(
                  context,
                  ref,
                  tab: tab,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    WidgetRef ref, {
    required MainTab tab,
  }) {
    final int index = tab.index;
    final isSelected = navigationShell.currentIndex == index;
    
    // ⚡ 优化：使用 const 十六进制预计算色值，提升运行时帧率
    const selectedColor = Color(0xFF3889FF);
    const unselectedColor = Color(0x991B202E); 
    final color = isSelected ? selectedColor : unselectedColor;

    return GestureDetector(
      onTap: () => _onTap(context, ref, index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? tab.selectedIcon : tab.icon,
            size: 24,
            color: color,
          ),
          // ⚡ 遵循系统设计规范，使用 Token 化间距
          const SizedBox(height: AppTokens.s4),
          Text(
            tab.label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
