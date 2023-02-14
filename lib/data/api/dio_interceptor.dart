import 'package:dio/dio.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/providers/auth_provider.dart';
import 'package:eventapp/services/locator.dart';

class DioInterceptor extends Interceptor {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = _prefsLocator.getUserToken();
    if (token != null && options.extra['noAuth'] != true) {
      options.headers['Authorization'] =
          'Bearer ${_prefsLocator.getUserToken()}';
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
      AuthProvider authProvider = getIt.get<AuthProvider>();
      AuthProvider repository = getIt.get<AuthProvider>();

      if (err.response!.data['code'] == 401) {
        try {
          var refreshToken = _prefsLocator.getRefreshToken();

          if (refreshToken == null) {
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

  refreshToken(ErrorInterceptorHandler handler) async {}

  _retry(RequestOptions requestOptions) {
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
