import 'dart:convert';
import 'dart:async';

import 'package:eventapp/app_define/app_config.dart';
import 'package:eventapp/data/api/auth_http_client.dart';
import 'package:flutter/widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  Timer? _authTimer;

  bool get isAuth {
    if (token != null) {
      return !JwtDecoder.isExpired(token!);
    }
    return false;
  }

  String? get token {
    return _token;
  }

  String? get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(AppConfig.shared.env!.restEndPoint + '/login_check');
    final client = AuthenticatedHttpClient();

    try {
      final response = await client.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            'username': email,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(responseData['message']);
      }
      _token = responseData['token'];

      Map<String, dynamic> decodedToken = JwtDecoder.decode(_token!);

      _userId = decodedToken['username'];
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token!);
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

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return false;
    }

    String? token = prefs.getString('token');

    if (JwtDecoder.isExpired(token!)) {
      return false;
    }
    _token = token;

    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }

    final remaining = JwtDecoder.getRemainingTime(_token!);
    _authTimer = Timer(remaining, logout);
  }
}
