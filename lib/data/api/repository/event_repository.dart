import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eventapp/data/api/dio_client.dart';
import 'package:eventapp/data/endpoints.dart';
import 'package:eventapp/models/event_model.dart';
import 'package:eventapp/services/locator.dart';

class EventRepository {
  final netWorkLocator = getIt.get<DioClient>();

  Future<List<EventModel>> getEvents() async {
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.allEvents}',
    );
    return response.data['hydra:member']
        .map<EventModel>((e) => EventModel.fromJson(e))
        .toList();
  }

  Future<dynamic> checkIn(String code) async {
    try {
      final response = await netWorkLocator.dio.post(
          '${EndPoints.baseUrl}${EndPoints.checkIn}',
          data: json.encode({'code': code}));
      return response.data;
    } on DioError catch (e) {
      e;
    }
  }
}
