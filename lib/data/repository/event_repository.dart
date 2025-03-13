import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ementin_flutter/data/api/dio_client.dart';
import 'package:ementin_flutter/data/endpoints.dart';
import 'package:ementin_flutter/models/event_model.dart';
import 'package:ementin_flutter/services/locator.dart';

import '../api/network_exceptions.dart';

class EventRepository {
  final netWorkLocator = getIt.get<DioClient>();

  Future<List<EventModel>> getEvents() async {
    try {
      final response = await netWorkLocator.dio.get(
        '${EndPoints.baseUrl}${EndPoints.allEvents}',
      );
      return response.data['hydra:member']
          .map<EventModel>((e) => EventModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e)));
    }
  }

  Future<dynamic> checkIn(int id, String code) async {
    try {
      final response = await netWorkLocator.dio
          .post('${EndPoints.baseUrl}${EndPoints.checkIn}',
              data: json.encode({
                'eventId': id,
                'code': code,
              }));
      return response.data;
    } catch (e) {
      throw Exception(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e)));
    }
  }
}
