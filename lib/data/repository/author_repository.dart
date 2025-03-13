import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ementin_flutter/data/api/dio_client.dart';
import 'package:ementin_flutter/data/endpoints.dart';
import 'package:ementin_flutter/models/author/author.dart';
import 'package:ementin_flutter/models/event_model.dart';
import 'package:ementin_flutter/services/locator.dart';

import '../api/network_exceptions.dart';

class AuthorRepository {
  final netWorkLocator = getIt.get<DioClient>();

  FutureOr<List<Author>> getSpeakers(EventModel event) async {
    try {
      netWorkLocator.dio.options.extra['event'] = event.domain;
      final response = await netWorkLocator.dio.get(
        '${EndPoints.baseUrl}${EndPoints.authors}',
      );
      final data = response.data['hydra:member']
          .map<Author>((e) => Author.fromJson(e))
          .toList();

      return data;
    } on DioException catch (e) {
      throw Exception(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e)));
    }
  }
}
