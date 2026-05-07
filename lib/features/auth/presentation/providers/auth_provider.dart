import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import '../../../../core/storage/storage_provider.dart';
import '../../domain/models/auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  static const _tokenKey = 'auth_token';

  @override
  AuthState build() {
    // 自动恢复 Supabase 保留在本地的 Session 会话
    final session = sb.Supabase.instance.client.auth.currentSession;
    
    if (session != null) {
      return AuthState.authenticated(token: session.accessToken);
    }
    return const AuthState.unauthenticated();
  }

  /// 使用 Supabase 真实的邮箱和密码进行登录
  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final response = await sb.Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      
      final token = response.session?.accessToken;
      if (token != null) {
        final storage = ref.read(storageProvider);
        await storage.setString(_tokenKey, token);
        state = AuthState.authenticated(token: token);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
      rethrow; // 抛出异常供 UI 拦截友好提示
    }
  }

  /// 调用 Supabase 登出并清除本地 Token 标识
  Future<void> logout() async {
    try {
      await sb.Supabase.instance.client.auth.signOut();
    } catch (_) {}
    
    final storage = ref.read(storageProvider);
    await storage.remove(_tokenKey);
    state = const AuthState.unauthenticated();
  }
}
