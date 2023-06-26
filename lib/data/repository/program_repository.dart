import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/models/program_item_model.dart';
import 'package:eventapp/services/locator.dart';

class ProgramRepository {
  final netWorkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<List<ProgramItemModel>> getProgram(
      EventModel event, DateTime? date) async {
    netWorkLocator.dio.options.extra['event'] = event.domain;
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.eventProgram}',
      queryParameters: {
        if (date != null) 'date': date,
      },
    );
    return response.data['hydra:member']
        .map<ProgramItemModel>((e) => ProgramItemModel.fromJson(e))
        .toList();
  }

  Future removeLike(int oldLike) async {
    final response = await netWorkLocator.dio.delete(
      '${EndPoints.baseUrl}${EndPoints.presentationFavorite}/$oldLike',
    );
    return response.data;
  }

  Future like(String iri) async {
    try {
      final response = await netWorkLocator.dio.post(
          '${EndPoints.baseUrl}${EndPoints.presentationFavorite}',
          data: json.encode({'presentation': iri}));
      return response.data;
    } on DioError catch (e) {
      e;
    }
  }

  Future addRate(value, ProgramItemModel programPresentation) async {
    final response = await netWorkLocator.dio
        .post('${EndPoints.baseUrl}${EndPoints.presentationRate}',
            data: json.encode({
              'presentation': programPresentation.iri,
              'value': value.round(),
            }));
    return response.data;
  }

  Future updateRate(value, ProgramItemModel programPresentation) async {
    final response = await netWorkLocator.dio.patch(
        '${EndPoints.baseUrl}${EndPoints.presentationRate}/${programPresentation.rate!.id}',
        data: json.encode({
          'value': value.round(),
        }));
    return response.data;
  }
}
