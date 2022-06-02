import 'dart:async';

import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/services/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../data/api/repository/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  String? _userId;
  Timer? _authTimer;
  final locator = getIt.get<SharedPreferenceHelper>();

  final AuthRepository _authRepository;

  AuthProvider(this._authRepository);

  bool get isAuth {
    var token = locator.getUserToken();
    if (token != null) {
      return !JwtDecoder.isExpired(token);
    }
    return false;
  }

  String? get userId {
    return _userId;
  }

  Future<void> loginWithCode(String code) async {
    try {
      final response = await _authRepository.logInWithCode(
        code: code,
      );
      final token = response["token"];
      await locator.setUserToken(userToken: token).then((value) {
        _autoLogout();
        notifyListeners();
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
      await locator.setUserToken(userToken: token).then((value) {
        _autoLogout();
        notifyListeners();
      });
      await locator.setRefreshToken(refreshToken: refreshToken).then((value) {
        notifyListeners();
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> refreshToken(String? rfToken) async {
    try {
      final response = await _authRepository.refreshToken(
        refreshToken: rfToken,
      );
      final token = response["token"];
      final refreshToken = response["refresh_token"];
      await locator.setUserToken(userToken: token).then((value) {
        _autoLogout();
        notifyListeners();
      });
      await locator.setRefreshToken(refreshToken: refreshToken).then((value) {
        notifyListeners();
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

  // Future<bool> tryAutoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey('token')) {
  //     return false;
  //   }

  //   String? token = prefs.getString('token');

  //   if (JwtDecoder.isExpired(token!)) {
  //     return false;
  //   }
  //   _token = token;

  //   notifyListeners();
  //   _autoLogout();
  //   return true;
  // }

  Future<void> logout() async {
    await locator.prefs.clear();
    _userId = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    var token = locator.getUserToken();

    final remaining = token == null
        ? const Duration(seconds: 0)
        : JwtDecoder.getRemainingTime(token);
    _authTimer = Timer(remaining, logout);
  }
}
