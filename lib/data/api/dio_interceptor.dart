import 'package:dio/dio.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';

class DioInterceptor extends Interceptor {
  final SharedPreferenceHelper sharedPreferences;
  DioInterceptor(this.sharedPreferences);

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
        // try {
        //   final refreshToken = await sharedPreferences.getRefreshToken();
//
        //   if (refreshToken == null ||
        //       err.response!.data['message'] == 'JWT Refresh Token Not Found' ||
        //       err.response!.data['message'] == 'Invalid JWT Refresh Token') {
        //  //   return authProvider.logout();
        //     //
        //   }
//
        //   await authProvider.refreshToken(refreshToken);
        //   return handler.resolve(await _retry(err.requestOptions));
        // } catch (err) {
        //   authProvider.logout();
        // }
      }
    }
    super.onError(err, handler);
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
