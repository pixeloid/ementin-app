import 'package:dio/dio.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/services/locator.dart';

class DioInterceptor extends Interceptor {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = _prefsLocator.getUserToken();
    if (token != null) {
      options.headers['Authorization'] =
          'Bearer ${_prefsLocator.getUserToken()}';
    }
    // options.headers['accept'] = 'application/json';
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   super.onError(err, handler);
  // }
}
