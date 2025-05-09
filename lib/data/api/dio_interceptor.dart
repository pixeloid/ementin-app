import 'package:dio/dio.dart';
import 'package:ementin_flutter/data/api/shared_preference_helper.dart';
import 'package:ementin_flutter/providers/auth_provider.dart';
import 'package:ementin_flutter/services/locator.dart';

class DioInterceptor extends Interceptor {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = _prefsLocator.getUserToken();

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

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      AuthProvider authProvider = getIt.get<AuthProvider>();
      AuthProvider repository = getIt.get<AuthProvider>();

      if (err.response!.data['code'] == 401) {
        try {
          var refreshToken = _prefsLocator.getRefreshToken();

          if (refreshToken == null ||
              err.response!.data['message'] == 'JWT Refresh Token Not Found' ||
              err.response!.data['message'] == 'Invalid JWT Refresh Token') {
            return repository.logout();
            //
          }

          await repository.refreshToken(refreshToken);
          return handler.resolve(await _retry(err.requestOptions));
        } catch (err) {
          authProvider.logout();
        }
      }
    }
    super.onError(err, handler);
  }

  _retry(RequestOptions requestOptions) {
    var token = _prefsLocator.getUserToken();

    if (token != null && requestOptions.extra['noAuth'] != true) {
      requestOptions.headers['Authorization'] =
          'Bearer ${_prefsLocator.getUserToken()}';
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
