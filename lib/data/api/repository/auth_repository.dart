import 'dart:async';

import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/services/locator.dart';

class AuthRepository {
  final netWorkLocator = getIt.get<DioClient>();

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? userName,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await netWorkLocator.dio
          .post('${EndPoints.baseUrl}${EndPoints.register}', data: {
        'email': email,
        'password': password,
        'username': userName,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to sign up');
      }
      completer.complete(response.data);
    } catch (e) {
      e;
    }
    return completer.future;
  }

  Future<Map<String, dynamic>> logIn({
    required String username,
    required String password,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await netWorkLocator.dio.post(
        '${EndPoints.baseUrl}${EndPoints.login}',
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to sign in');
      }

      completer.complete(response.data);
    } catch (e) {
      e;
    }
    return completer.future;
  }

  Future<Map<String, dynamic>> logInWithCode({
    required String code,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await netWorkLocator.dio.post(
        '${EndPoints.baseUrl}${EndPoints.loginWithCode}',
        data: {
          'code': code,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to sign in');
      }

      completer.complete(response.data);
    } catch (e) {
      e;
    }
    return completer.future;
  }

  Future<Map<String, dynamic>> refreshToken({
    required String? refreshToken,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      netWorkLocator.dio.options.extra = {'noAuth': true};
      final response = await netWorkLocator.dio.post(
        '${EndPoints.baseUrl}${EndPoints.refreshToken}',
        data: {
          'refresh_token': refreshToken,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to refresh token');
      }

      completer.complete(response.data);
    } catch (e) {
      e;
    }
    return completer.future;
  }
}
