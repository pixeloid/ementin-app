import 'dart:convert';

import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/features/event/domain/event_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/program_item_model.dart';

class ProgramRepository {
  final DioClient netWorkLocator;

  ProgramRepository(this.netWorkLocator);

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

  toggleFavourite(int id) async {
    final response = await netWorkLocator.dio.post(
        '${EndPoints.baseUrl}${EndPoints.presentationToggleFavourite}/$id',
        data: json.encode({}));
    return response.data;
  }
}

final programRepositoryProvider = Provider<ProgramRepository>((ref) {
  return ProgramRepository(ref.watch(dioClientProvider));
});
