import 'dart:async';

import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(apiService: ref.watch(dioClientProvider));
});

class AuthRepository {
  final DioClient _apiService;

  AuthRepository({required DioClient apiService}) : _apiService = apiService;

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? userName,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await _apiService.dio
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
      final response = await _apiService.dio.post(
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
      final response = await _apiService.dio.post(
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
      _apiService.dio.options.extra = {'noAuth': true};
      final response = await _apiService.dio.post(
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
      rethrow;
    }
    return completer.future;
  }
}
