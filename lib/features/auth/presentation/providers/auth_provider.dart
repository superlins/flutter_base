import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/storage_provider.dart';
import '../../domain/models/auth_state.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  static const _tokenKey = 'auth_token';

  @override
  AuthState build() {
    final storage = ref.watch(storageProvider);
    final token = storage.getString(_tokenKey);
    
    if (token != null) {
      return AuthState.authenticated(token: token);
    }
    return const AuthState.unauthenticated();
  }

  /// 模拟登录方法
  Future<void> login(String username, String password) async {
    state = const AuthState.loading();
    await Future.delayed(const Duration(seconds: 1)); // 模拟网络延迟
    
    const mockToken = 'mock_jwt_token_123456';
    final storage = ref.read(storageProvider);
    await storage.setString(_tokenKey, mockToken);
    
    state = const AuthState.authenticated(token: mockToken);
  }

  /// 登出方法
  Future<void> logout() async {
    final storage = ref.read(storageProvider);
    await storage.remove(_tokenKey);
    state = const AuthState.unauthenticated();
  }
}
