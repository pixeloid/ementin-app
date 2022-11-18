import 'package:eventapp/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_state.dart';

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository: authRepository);
  },
);

class AuthController extends StateNotifier<AuthState> {
  AuthController({
    required this.authRepository,
  }) : super(const AuthState());

  final AuthRepository authRepository;

  Future<void> initAction() async {
    state = state.copyWith(isBusy: true);
    try {
      final storedRefreshToken =
          await const FlutterSecureStorage().read(key: 'refresh_token');

      // Check stored refresh token
      if (storedRefreshToken == null) {
        state = state.copyWith(isBusy: false);
        return;
      }

      // Call init action repository
      final data = await authRepository.initAction(storedRefreshToken);
      state = state.copyWith(isBusy: false, isLoggedIn: true, data: data);
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      logout();
    }
  }

  Future<void> login() async {
    state = state.copyWith(isBusy: true);
    try {
      final data = await authRepository.login();
      state = state.copyWith(isBusy: false, isLoggedIn: true, data: data);
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      state = state.copyWith(
          isBusy: false, isLoggedIn: false, errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isBusy: true);
    await const FlutterSecureStorage().delete(key: 'refresh_token');
    state = state.copyWith(isBusy: false, isLoggedIn: false);
  }
}
