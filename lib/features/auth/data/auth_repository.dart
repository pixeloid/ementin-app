import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/http/dio_provider.dart';
import '../domain/token_response_model.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({
    required this.client,
  });

  final Dio client;

  Future<Map<String, Object>> initAction(String storedRefreshToken) async {
    final response = await _tokenRequest(storedRefreshToken);
    final TokenResponseModel token = TokenResponseModel.fromMap(response.data);

    final bearerToken = _parseIdToken(token.token);
    final refreshToken = token.refreshToken;
    final profile = await _getUserDetails(token.token);

    const FlutterSecureStorage()
        .write(key: 'refresh_token', value: refreshToken);

    return {...bearerToken};
  }

  Future<Response> _tokenRequest(String? refreshToken) async {
    client.options.extra = {'noAuth': true};
    final response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.refreshToken}',
      data: {
        'refresh_token': refreshToken,
      },
    );

    return response;
  }

  Future<Map<String, dynamic>> login({
    String? username,
    String? password,
  }) async {
    client.options.extra = {'noAuth': true};
    final response = await client.post(
      '${EndPoints.baseUrl}${EndPoints.login}',
      data: {
        'username': "olah.gergely@pixeloid.hu",
        'password': "kadfes-gaqguq-weCze5",
      },
    );
    final TokenResponseModel token = TokenResponseModel.fromMap(response.data);

    final bearerToken = _parseIdToken(token.token);
    final refreshToken = token.refreshToken;
    final profile = await _getUserDetails(token.token);

    const FlutterSecureStorage()
        .write(key: 'refresh_token', value: refreshToken);

    return {...bearerToken};
  }

  Future<Map<String, dynamic>> logInWithCode({
    required String code,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await client.post(
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
      client.options.extra = {'noAuth': true};
      final response = await client.post(
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

  _getUserDetails(String accessToken) {}

  Map<String, Object> _parseIdToken(String? idToken) {
    final List<String> parts = idToken!.split('.');
    assert(parts.length == 3);

    return Map<String, Object>.from(jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))));
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => AuthRepository(
      client: ref.watch(dioProvider), // the provider we defined above
    );
