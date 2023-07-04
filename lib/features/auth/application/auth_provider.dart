import 'dart:async';

import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/utils/states/future_state.codegen.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../data/repository/auth_repository.dart';

final isLoggedInProvider =
    StateProvider<bool>((ref) => ref.read(authProvider.notifier).isAuth);

final authProvider = StateNotifierProvider<AuthProvider, FutureState<bool?>>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    return AuthProvider(
      ref,
      authRepository: authRepository,
      sharedPreferences: sharedPreferences,
    );
  },
);

class AuthProvider extends StateNotifier<FutureState<bool?>> {
  Timer? _authTimer;

  bool loggingOut = false;

  final AuthRepository _authRepository;
  final SharedPreferenceHelper _sharedPreferences;
  final Ref _ref;

  AuthProvider(
    this._ref, {
    required AuthRepository authRepository,
    required SharedPreferenceHelper sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _authRepository = authRepository,
        super(const FutureState.idle());

  bool get isAuth {
    var token = _sharedPreferences.getUserToken();
    if (token != null) {
      return !JwtDecoder.isExpired(token);
    }
    return false;
  }

  Future<void> loginWithCode(String code) async {
    try {
      final response = await _authRepository.logInWithCode(
        code: code,
      );
      final token = response["token"];
      final refreshToken = response["refresh_token"];
      await _sharedPreferences.setUserToken(userToken: token).then((value) {
        // _autoLogout();
      });
      await _sharedPreferences
          .setRefreshToken(refreshToken: refreshToken)
          .then((value) {
        _ref.read(isLoggedInProvider.notifier).state = true;
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    try {
      final response = await _authRepository.logIn(
        username: email,
        password: password,
      );
      final token = response["token"];
      final refreshToken = response["refresh_token"];
      await _sharedPreferences.setUserToken(userToken: token).then((value) {
        //_autoLogout();
      });
      await _sharedPreferences
          .setRefreshToken(refreshToken: refreshToken)
          .then((value) {
        _ref.read(isLoggedInProvider.notifier).state = true;
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'verifyPassword');
  }

  void logout({
    VoidCallback? onSuccess,
  }) {
    loggingOut = true;
    _sharedPreferences.resetKeys();
    state = const FutureState.idle();
    _ref.invalidate(isLoggedInProvider);
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    loggingOut = false;
    if (onSuccess != null) {
      onSuccess();
    }
  }

  // ignore: unused_element
  void _autoLogout() async {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    var token = _sharedPreferences.getUserToken();

    final remaining = token == null
        ? const Duration(seconds: 0)
        : JwtDecoder.getRemainingTime(token);
    _authTimer = Timer(remaining, logout);
  }

  Future<DateTime?> getTokenExpiryDate() async {
    var token = _sharedPreferences.getUserToken();
    return token == null ? null : JwtDecoder.getExpirationDate(token);
  }
}
