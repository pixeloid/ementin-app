import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/api/shared_preference_helper.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/models/program_section_model.dart';
import 'package:eventapp/services/locator.dart';

class ProgramRepository {
  final netWorkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<List<ProgramSectionModel>> getProgram(int eventId) async {
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.eventProgram}',
      queryParameters: {'event': eventId},
    );
    return response.data['hydra:member']
        .map<ProgramSectionModel>((e) => ProgramSectionModel.fromJson(e))
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
}
