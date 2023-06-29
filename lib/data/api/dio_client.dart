import 'package:dio/dio.dart';
import 'package:eventapp/data/api/dio_interceptor.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DioClient {
  final Dio _dio = Dio();
  final SharedPreferenceHelper sharedPreferences;
  DioClient(this.sharedPreferences) {
    _dio.interceptors.add(DioInterceptor(
      sharedPreferences,
    ));
  }

  Dio get dio => _dio;
}

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(
    ref.watch(sharedPreferencesProvider),
  );
});
