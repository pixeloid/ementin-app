import 'dart:async';

import 'package:dio/dio.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:flutter/foundation.dart';

import '../endpoints.dart';

class DioInterceptor extends Interceptor {
  final SharedPreferenceHelper sharedPreferences;
  final Dio dio;
  DioInterceptor(
    this.sharedPreferences,
    this.dio,
  );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = sharedPreferences.getUserToken();

    if (options.extra['event'] != null) {
      options.headers['event'] = options.extra['event'];
    }

    if (token != null && options.extra['noAuth'] != true) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    if (options.method == 'PATCH') {
      options.headers['content-type'] =
          'application/merge-patch+json; charset=utf-8';
    }

    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      if (err.response!.data['code'] == 401) {
        try {
          final refreshToken = sharedPreferences.getRefreshToken();

          if (refreshToken == null ||
              err.response!.data['message'] == 'JWT Refresh Token Not Found' ||
              err.response!.data['message'] == 'Invalid JWT Refresh Token') {
            return sharedPreferences.resetKeys();
            //
          }

          await _refreshToken(refreshToken);
          return handler.resolve(await _retry(err.requestOptions));
        } catch (err) {
          return sharedPreferences.resetKeys();
        }
      }
    }
    super.onError(err, handler);
  }

  Future<void> _refreshToken(String? rfToken) async {
    try {
      dio.options.extra = {'noAuth': true};
      final response = await dio.post(
        '${EndPoints.baseUrl}${EndPoints.refreshToken}',
        data: {
          'refresh_token': rfToken,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to refresh token');
      }

      final token = response.data["token"];
      final refreshToken = response.data["refresh_token"];
      sharedPreferences.setUserToken(userToken: token).then((value) {});
      sharedPreferences.setRefreshToken(refreshToken: refreshToken);
      debugPrint('Token updated to: $token');
    } on DioError catch (_) {
      sharedPreferences.resetKeys();
    }
  }

  _retry(RequestOptions requestOptions) async {
    var token = sharedPreferences.getUserToken();

    if (token != null && requestOptions.extra['noAuth'] != true) {
      requestOptions.headers['Authorization'] =
          'Bearer ${sharedPreferences.getUserToken()}';
    }
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    final dio = Dio();

    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
