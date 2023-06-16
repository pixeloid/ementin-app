import 'package:dio/dio.dart';
import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/models/author_model.dart';
import 'package:eventapp/services/locator.dart';

import '../network_exceptions.dart';

class AuthorRepository {
  final netWorkLocator = getIt.get<DioClient>();

  getSpeakers(int id) async {
    try {
      final response = await netWorkLocator.dio.get(
        '${EndPoints.baseUrl}${EndPoints.speakers}',
        queryParameters: {
          'event': id,
        },
      );
      final data = response.data['hydra:member']
          .map<AuthorModel>((e) => AuthorModel.fromJson(e))
          .toList();

      return data;
    } on DioError catch (e) {
      throw Exception(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e)));
    }
  }
}
