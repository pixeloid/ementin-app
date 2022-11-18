import 'package:dio/dio.dart';
import 'package:eventapp/data/api/dio_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final Dio dio = Dio();
  return dio
    ..interceptors.addAll(
      [
        DioInterceptor(),
      ],
    );
}
