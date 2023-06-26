import 'dart:async';

import 'package:dio/dio.dart';
import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/models/author_model.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/services/locator.dart';

import '../network_exceptions.dart';

class AuthorRepository {
  final netWorkLocator = getIt.get<DioClient>();

  FutureOr<List<AuthorModel>> getSpeakers(EventModel event) async {
    try {
      netWorkLocator.dio.options.extra['event'] = event.domain;
      final response = await netWorkLocator.dio.get(
        '${EndPoints.baseUrl}${EndPoints.speakers}',
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
